import os
import sys
import json
from typing import Dict, Generator

import numpy as np


def load_data() -> Generator[Dict[str, np.ndarray], None, None]:
    from edge_ocr.utils.base import UserConfig
    from edge_ocr.utils.image_utils import load_detect_image

    user_config = UserConfig('trt.env')
    imgsrc = [os.path.join(user_config.data_dir, f) for f in os.listdir(user_config.data_dir)]
    for path in imgsrc[:10]:
        print(path)
        img, *_ = load_detect_image(path)
        yield {'images': img.astype(np.float32)}


def postprocess(result_path: str):
    from polygraphy.comparator.struct import RunResults
    from polygraphy.json import load_json

    for _, outputs in RunResults.load(result_path):
        for output in outputs:
            arr = output['output'].squeeze() # (16128,6) x y w h score confidence
            # simply pickup the highest score bbox
            x, y, w, h = arr[np.argmax(arr[:,-2])][:4].astype(np.int64)
            print(x-w//2, y-h//2, x+w//2, y+w//2)


if __name__ == '__main__':
    postprocess(sys.argv[1])
