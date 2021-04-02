#!/usr/bin/env python
import time, pigpio, random

pi = pigpio.pi()
not pi.connected and exit()
G = 13  # 23 tilt, 24 pan, GPIO 27 pin 13 LDS
t = 2.0
f = 100
pi.set_PWM_frequency(G, f)
pi.set_PWM_range(G, 1000000/f)

while True:
  try:
    d = random.randrange(600, 2400)  # 500-2400 us
    print(d)
    pi.set_PWM_dutycycle(G, d)
    time.sleep(t)
  except KeyboardInterrupt:
    break

print("\nTidying up")
pi.stop()
