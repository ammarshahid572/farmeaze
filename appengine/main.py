#Import necessary libraries
import os
from flask import Flask, render_template, Response, request, redirect, url_for
import cv2
from werkzeug.utils import secure_filename
from agriClassifier import Classifier
#Initialize the Flask app

app = Flask(__name__)
UPLOAD_FOLDER='static'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
ALLOWED_EXTENSIONS = {'jpg', 'png', 'gif'}



def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/')
def index():
    return render_template('index.html')
@app.route('/form')
def form():
    form='''
        <!doctype html>
        <title>Upload new File</title>
        <h1>Upload new File</h1>
        <form method=post action="/upload" enctype=multipart/form-data>
          <input type=file name=file>
          <input type=submit value=Upload>
        </form>
        '''
    return form
@app.route('/upload', methods=['GET', 'POST'])
def upload_file():
    filename=""
    if request.method == 'POST':
        # check if the post request has the file part
        if 'file' not in request.files:
            #flash('No file part')
            print("No file part")
            return redirect(request.url)
        file = request.files['file']
        # If the user does not select a file, the browser submits an
        # empty file without a filename.
        if file.filename == '':
            #flash('No selected file')
            print("no file selected")
            return redirect(request.url)
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            dst=os.path.join(app.config['UPLOAD_FOLDER'], filename)
            file.save(dst)
            #classifier(dst)
            pclass, confi=Classifier(dst)
            print(pclass)
            response= dict()
            response["pclass"]= pclass
            responde["confidence"]=confi
            return json.dumps(response)
    return 'Error'

if __name__ == '__main__':
   app.run(port=8080)
    
