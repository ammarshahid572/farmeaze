

import tensorflow as tf
import numpy as np
import cv2
from tensorflow import keras
from tensorflow.keras import layers
from tensorflow.keras.models import Sequential

from keras.models import load_model
model = load_model(r'classifiers/agriDrone3.h5')


def Classifier(img_path):
    class_names=['corn', 'jute', 'rice']
    dim=(600,600)
    frame=cv2.imread(img_path)
    

    frame=cv2.resize(frame, dim, interpolation=cv2.INTER_AREA)

    frame= cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
     
    #img = keras.preprocessing.image.load_img(test_path, target_size=(img_height, img_width))
    #img_array = keras.preprocessing.image.img_to_array(img)

    img_array = tf.expand_dims(frame, 0) # Create a batch

    predictions = model.predict(img_array)
    score = tf.nn.softmax(predictions[0])
    return class_names[np.argmax(score)], 100 * np.max(score)

if __name__=="__main__":
    img_path="static//test2.jpg"
    print (Classifier(img_path))
