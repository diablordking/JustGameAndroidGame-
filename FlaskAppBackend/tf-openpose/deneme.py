import json,math

with open('data.json') as f:
    # json_data = ast.literal_eval(f)
    data1 = json.load(f)

with open('data2.json') as f:
    # json_data = ast.literal_eval(f)
    data2 = json.load(f)


def common_elements(list1, list2):
    """
    Return a list containing the elements which are in both list1 and list2

    [3, 5]
    ['this', 'that']
    """

    result = set(list2).intersection(list1)
    return result

def getDistance(x1,y1,x2,y2):
    print ("x1="+str(x1) )
    print ("x2="+str(x2))
    print ("y1="+str(y1))
    print ("y2=" + str(y2))

    dist = math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2)
    print ("Dist="+str(dist))
    return dist


pointsys =0
for image,image1 in zip(data1["list"],data2["list"]):
    imagepoint = 0

    if image == "Empty" or image1 == "Empty":
        continue
    ortak = common_elements(image.keys(), image1.keys())

    for comnumber in ortak:
        dist = getDistance(image[comnumber][0], image[comnumber][1],image1[str(comnumber)][0], image1[str(comnumber)][1])
        print ("Dist number = "+str(dist))
        if (dist < 0.25):
            pointsys = pointsys + 2
        else:
            pointsys = pointsys - 2

print pointsys