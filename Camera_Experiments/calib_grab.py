
from vmbpy import *


opencv_disp_format = PixelFormat.Bgr8

def setup_camera(cam: Camera):
    with cam:
        cam.ExposureAuto.set('Off')
        cam.BalanceWhiteAuto.set('Off')
        print_all_features(cam)


def get_first_camera():
    with VmbSystem.get_instance() as vmb:
        return vmb.get_all_cameras()[0]
    
def print_all_features(module: FeatureContainer):
    for feat in module.get_all_features():
        print_feature(feat)

def print_feature(feature: FeatureTypes):
    try:
        value = feature.get()

    except (AttributeError, VmbFeatureError):
        value = None

    print('/// Feature name   : {}'.format(feature.get_name()))
    print('/// Display name   : {}'.format(feature.get_display_name()))
    print('/// Tooltip        : {}'.format(feature.get_tooltip()))
    print('/// Description    : {}'.format(feature.get_description()))
    print('/// SFNC Namespace : {}'.format(feature.get_sfnc_namespace()))
    print('/// Value          : {}\n'.format(str(value)))

with VmbSystem.get_instance():
    cam = get_first_camera()
    setup_camera(cam)