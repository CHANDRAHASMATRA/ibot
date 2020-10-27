#!/usr/bin/env python

import cv_bridge
import cv2
import time
import math
import rospy
import sys
from geometry_msgs.msg import Twist

def tracker(): 
    rospy.init_node('move_turtle',anonymous=True)
    pub=rospy.Publisher('/turtle/cmd_vel',Twist,queue_size=10)
    rate=rospy.Rate(10)   
    v=Twist()
    while not rospy.is_shutdown():
        cap=cv2.VideoCapture(0)
        time.sleep(0.1)
        ret, frame = cap.read()
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        gaussian_blur=cv2.GaussianBlur(gray, (15, 15), 0)
        ret,thresh1 = cv2.threshold(gaussian_blur,140,255,cv2.THRESH_BINARY)
        _,contours, hierarchy = cv2.findContours(thresh1,  
        cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE) 
        L=[0,0]
        for cnt in contours:
            area=cv2.contourArea(cnt)
            s=len(L)-1
            if area>1000:
                peri=cv2.arcLength(cnt,True)
                approx=cv2.approxPolyDP(cnt,0.02*peri,True)
                x,y,w,h=cv2.boundingRect(approx)
                a=math.atan(((h/2)-L[s])/-v)-2*(3.14)
                v.linear.x=L[s-1]-(w/2)
                v.linear.y=0
                v.linear.z=0
                v.angular.x=0
                v.angular.y=0
                v.angular.z=a
                pub.publish(v)
                L.append(w/2)
                L.append(h/2)
                cv2.rectangle(frame,(x,y),(x+w,y+h),(0,255,0),5)
                rate.sleep()

if __name__=='__main__':
    try:
        tracker()
    except rospy.ROSInterruptException:
        pass
