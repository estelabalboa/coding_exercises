from PIL import Image, ImageStat
import os
from functools import reduce

MONOCHROMATIC_MAX_VARIANCE = 0.005
COLOR = 1000
MAYBE_COLOR = 100

def detect_color_image(path, item):
    # v = ImageStat.Stat(file).var
    v = ImageStat.Stat(Image.open(path + item)).var
    is_monochromatic = reduce(lambda x, y: x and y < MONOCHROMATIC_MAX_VARIANCE, v, True)
    print('-------------------------------------------------')
    print (item, '-->\t')
    print(v)
    if is_monochromatic:
        print ("Monochromatic image"),
    else:
        if len(v)==3:
            maxmin = abs(max(v) - min(v))
            if maxmin > COLOR:
                print ("Color\t\t\t"),
            elif maxmin > MAYBE_COLOR:
                print ("Maybe color\t"),
            else:
                print ("grayscale\t\t"),
            print ("(",maxmin,")")
        elif len(v)==1:
            print ("Black and white")
        else:
            print ("Don't know...")




if __name__ == '__main__': # windows support
    # setup the pool and start processing jobs
    print('Looping over folder')
    path = "mypath" # replace
    photos = os.listdir(path)
    print(photos)
    for item in photos:
        print(os.path.isfile(path + item))
        # im = Image.open(path + item).convert('RGB')
        detect_color_image(path,item)

        print("Detect Colour Image")
