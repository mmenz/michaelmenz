from PIL import Image
import numpy as np

profile = Image.open("profile.png")
arr = np.array(profile)

colors = list(set(arr.flatten().tolist()))

base = np.zeros_like(arr)
for color in colors:
	im = Image.fromarray(base.astype("uint8"))
	im.save("png/profile%d.png"%color)
	layer = color*np.ones_like(arr)
	base = np.fmin(arr, layer)