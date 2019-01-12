import os
import sqlite3
import run_video
from flask import Flask, flash, request, redirect, url_for ,jsonify, g
import json
import numpy as np
import math




DATABASE = 'sqlite.db'


app = Flask(__name__)
UPLOAD_FOLDER = './video'
ALLOWED_EXTENSIONS = set(['txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif',"mp4"])

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.secret_key = 'super secret key'
app.config['SESSION_TYPE'] = 'filesystem'
app.config['APP_SETTINGS'] = "development"

def get_db():
    db = getattr(g, '_database', None)
    if db is None:
        db = g._database = sqlite3.connect(DATABASE)
    return db

def query_db(query, args=(), one=False):
    cur = get_db().execute(query, args)
    alp = get_db()
    alp.commit()
    rv = cur.fetchall()
    cur.close()
    return (rv[0] if rv else None) if one else rv

def common_elements(list1, list2):
    """
    Return a list containing the elements which are in both list1 and list2

    [3, 5]
    ['this', 'that']
    """
    list3 = list(map(int, list2))

    gereksizsayılar = [14, 15, 16, 17, 18,0,1,9,10,12,13]
    for sayı in gereksizsayılar:
        try:
            b = list3.index(sayı)
        except ValueError:
            "Do nothing"
        else:
            list3.pop(b)
            "Do something with variable b"


    print ("List3"+str(list3))




    result = set(list3).intersection(list1)
    return result

def getDistance(x1,y1,x2,y2):
    print ("x1="+str(x1) )
    print ("x2="+str(x2))
    print ("y1="+str(y1))
    print ("y2=" + str(y2))

    dist = math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2)
    print ("Dist="+str(dist))
    return dist

def dataprocess(data):
    with open('orginalfloss.json') as f:
        #json_data = ast.literal_eval(f)
        data1 = json.load(f)
    f.close()
    pointsys = 0
    for image,image1 in zip(data["list"],data1["list"]):
        imagepoint = 0
        print (image)
        print (image1)
        if image == "Empty" or image1 == "Empty":
            pointsys = pointsys - 5
            continue
        ortak = common_elements(image.keys(), image1.keys())

        for comnumber in ortak:
            dist = getDistance(image[comnumber][0]*10, image[comnumber][1]*10,image1[str(comnumber)][0]*10, image1[str(comnumber)][1]*10)
            print ("Dist number = "+str(dist))
            if (dist < 1.5):
                pointsys = pointsys + 2
            else:
                pointsys = pointsys - 2


    return pointsys

@app.teardown_appcontext
def close_connection(exception):
    db = getattr(g, '_database', None)
    if db is not None:
        db.close()

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS



@app.route("/hello")
def hello():
    return run_video.main2()
@app.route("/")
def hello2():
    return "Hello World!"

@app.route('/upload', methods=['POST','GET'])
def upload_file():

    if request.method == 'POST':
        # check if the post request has the file part
        if 'file' not in request.files:
            flash('No file part')
            return redirect(request.url)
        file = request.files['file']
        # if user does not select file, browser also
        # submit an empty part without filename
        if file.filename == '':
            flash('No selected file')
            return redirect(request.url)
        if file and allowed_file(file.filename):
            filename = file.filename
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
            data1 =  run_video.main2(filename)
            """
            with open('datafullzaman.json', 'w') as outfile:
                json.dump(data1, outfile)
            """
            points = dataprocess(data1)

            user = query_db('INSERT INTO videodata(username,video_filename,data) VALUES (?,?,?)',
                            ["alp",filename,str(run_video.main2(filename))], one=True)

            return str(points)

@app.route('/getdata', methods=['GET', 'POST'])
def getvideodata():
    if request.method=='GET':
        query_string = request.args.get('username')
        user = query_db('select * from videodata where username = ?',
                        [query_string], one=True)
        return user
    elif request.method=='POST':
        return "OK this is a post method"
    else:
        return("ok")

if __name__ == '__main__':
    app.run(host='0.0.0.0',port=5000)
