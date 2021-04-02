#!/usr/bin/python

import pigpio
import time

pi = pigpio.pi()
pin = 27
#pi.set_mode(pin, pigpio.OUTPUT)
pi.set_mode(pin, pigpio.INPUT)

exit()
print ("mode: ", pi.get_mode(pin))
print("setting to: ",pi.set_servo_pulsewidth(pin, 1500))
print("set to: ",pi.get_servo_pulsewidth(pin))

time.sleep(1)

print("setting to: ",pi.set_servo_pulsewidth(pin, 1000))
print("set to: ",pi.get_servo_pulsewidth(pin))

time.sleep(1)

print("setting to: ",pi.set_servo_pulsewidth(pin, 2000))
print("set to: ",pi.get_servo_pulsewidth(pin))


time.sleep(1)

pi.stop()
