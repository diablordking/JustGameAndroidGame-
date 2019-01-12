import argparse
import logging
from time import time
from enum import Enum

import cv2
import numpy as np
import os.path
import sys
sys.path.append(os.path.join(os.path.dirname(__file__), '..'))
from tf_pose.estimator import TfPoseEstimator
from tf_pose.networks import get_graph_path, model_wh
import tensorflow as tf

logger = logging.getLogger('TfPoseEstimator-Video')
logger.setLevel(logging.DEBUG)
ch = logging.StreamHandler()
ch.setLevel(logging.DEBUG)
formatter = logging.Formatter('[%(asctime)s] [%(name)s] [%(levelname)s] %(message)s')
ch.setFormatter(formatter)
logger.addHandler(ch)


class CocoPart(Enum):
    Nose = 0
    Neck = 1
    RShoulder = 2
    RElbow = 3
    RWrist = 4
    LShoulder = 5
    LElbow = 6
    LWrist = 7
    RHip = 8
    RKnee = 9
    RAnkle = 10
    LHip = 11
    LKnee = 12
    LAnkle = 13
    REye = 14
    LEye = 15
    REar = 16
    LEar = 17
    Background = 18


Alldata = []



def main2(name):
    """business logic for when running this module as the primary one!"""
    fps_time = 0

    parser = argparse.ArgumentParser(description='tf-pose-estimation Video')
    parser.add_argument('--video', type=str, default='')
    parser.add_argument('--resize', type=str, default='0x0',
                        help='if provided, resize images before they are processed. default=0x0, Recommends : 432x368 or 656x368 or 1312x736 ')
    parser.add_argument('--resize-out-ratio', type=float, default=4.0,
                        help='if provided, resize heatmaps before they are post-processed. default=1.0')
    parser.add_argument('--model', type=str, default='mobilenet_thin', help='cmu / mobilenet_thin')
    parser.add_argument('--show-process', type=bool, default=False,
                        help='for debug purpose, if enabled, speed for inference is dropped.')
    parser.add_argument('--showBG', type=bool, default=True, help='False to show skeleton only.')
    args = parser.parse_args()
    args.video = "./video/"+name
    args.model = "mobilenet_thin"
    args.resize = "368x368"
    args.showBG = False
    logger.debug('initialization %s : %s' % (args.model, get_graph_path(args.model)))

    w, h = model_wh(args.resize)
    if w > 0 and h > 0:
        e = TfPoseEstimator(get_graph_path(args.model), target_size=(w, h))
    else:
        e = TfPoseEstimator(get_graph_path(args.model), target_size=(432, 368),tf_config=tf.ConfigProto(log_device_placement=True))

    cap = cv2.VideoCapture(args.video)
    length = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))
    print(length)
    previous = time()
    delta = 0
    bodydata = {"list":[]}

    if cap.isOpened() is False:
        print("Error opening video stream or file")
    while cap.isOpened():
        current = time()
        delta += current - previous
        previous = current
        #
        # if delta > 0.3:
        #     # Operations on image
        #     # Reset the time counter
        #     delta = 0
        #     continue;
        key = 0

        ret_val, image = cap.read()
        try:
            image.data
        except Exception:
            break

        logger.debug('image process+')
        humans = e.inference(image, resize_to_default=(w > 0 and h > 0), upsample_size=args.resize_out_ratio)
        if not args.showBG:
            image = np.zeros(image.shape)


        logger.debug('postprocess+')

        #image = TfPoseEstimator.draw_humans(image, humans, imgcopy=False)
        tinydic = {}

        if not humans:
            logger.debug(humans)
            bodydata["list"].append("Empty")
        else:
            for key, value in humans[0].body_parts.items():
                tinydic[key] = [value.x,value.y]
            print (tinydic)
            bodydata["list"].append(tinydic)


        """
        logger.debug('show+')
        cv2.putText(image, "FPS: %f" % (1v.0 / (time.time() - fps_time)), (10, 10), cv2.FONT_HERSHEY_SIMPLEX, 0.5,
                    (0, 255, 0), 2)
        cv2.imshow('tf-pose-estimation result', image)
        fps_time = time.time()
        """
        if cv2.waitKey(1) == 27:
            break

    cv2.destroyAllWindows()

    return bodydata
