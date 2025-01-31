
# List Cameras Example: https://docs.alliedvision.com/Vimba_X/Vimba_X_DeveloperGuide/pythonAPIManual.html#listing-cameras

# Asynchronous grab
import time
from vmbpy import *

opencv_display_format = PixelFormat.Bgr8


def frame_handler(cam: Camera, stream: Stream, frame: Frame):
    cam.queue_frame(frame)
    img = frame.as_opencv_image();
    print(img);

with VmbSystem.get_instance() as vmb:
    cams = vmb.get_all_cameras()
    with cams[0] as cam:
        print(cam);
        cam.start_streaming(frame_handler)
        time.sleep(1)
        cam.stop_streaming()