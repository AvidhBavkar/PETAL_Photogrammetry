{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2023.3.0",
        "fileVersion": "1.1",
        "template": false,
        "nodesVersions": {
            "FeatureExtraction": "1.3",
            "StructureFromMotion": "3.3",
            "ImageMatching": "2.0",
            "CameraInit": "9.0",
            "DepthMap": "5.0",
            "DepthMapFilter": "4.0",
            "PrepareDenseScene": "3.1",
            "MeshFiltering": "3.0",
            "Texturing": "6.0",
            "FeatureMatching": "2.0",
            "Meshing": "7.0"
        }
    },
    "graph": {
        "Texturing_1": {
            "nodeType": "Texturing",
            "position": [
                2000,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "64d541bc136dbbd86023e41be5c1749b17348b91"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{Meshing_1.output}",
                "imagesFolder": "{DepthMap_1.imagesFolder}",
                "inputMesh": "{MeshFiltering_1.outputMesh}",
                "inputRefMesh": "",
                "textureSide": 8192,
                "downscale": 2,
                "outputMeshFileType": "obj",
                "colorMapping": {
                    "enable": true,
                    "colorMappingFileType": "exr"
                },
                "bumpMapping": {
                    "enable": true,
                    "bumpType": "Normal",
                    "normalFileType": "exr",
                    "heightFileType": "exr"
                },
                "displacementMapping": {
                    "enable": true,
                    "displacementMappingFileType": "exr"
                },
                "unwrapMethod": "Basic",
                "useUDIM": true,
                "fillHoles": false,
                "padding": 5,
                "multiBandDownscale": 4,
                "multiBandNbContrib": {
                    "high": 1,
                    "midHigh": 5,
                    "midLow": 10,
                    "low": 0
                },
                "useScore": true,
                "bestScoreThreshold": 0.1,
                "angleHardThreshold": 90.0,
                "workingColorSpace": "sRGB",
                "outputColorSpace": "AUTO",
                "correctEV": true,
                "forceVisibleByAllVertices": false,
                "flipNormals": false,
                "visibilityRemappingMethod": "PullPush",
                "subdivisionTargetRatio": 0.8,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "outputMesh": "{cache}/{nodeType}/{uid0}/texturedMesh.{outputMeshFileTypeValue}",
                "outputMaterial": "{cache}/{nodeType}/{uid0}/texturedMesh.mtl",
                "outputTextures": "{cache}/{nodeType}/{uid0}/texture_*.exr"
            }
        },
        "Meshing_1": {
            "nodeType": "Meshing",
            "position": [
                1600,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "da155b3fe0a1314114b58ee4bb1fbf7b4351a02f"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{DepthMapFilter_1.input}",
                "depthMapsFolder": "{DepthMapFilter_1.output}",
                "outputMeshFileType": "obj",
                "useBoundingBox": false,
                "boundingBox": {
                    "bboxTranslation": {
                        "x": 0.0,
                        "y": 0.0,
                        "z": 0.0
                    },
                    "bboxRotation": {
                        "x": 0.0,
                        "y": 0.0,
                        "z": 0.0
                    },
                    "bboxScale": {
                        "x": 1.0,
                        "y": 1.0,
                        "z": 1.0
                    }
                },
                "estimateSpaceFromSfM": true,
                "estimateSpaceMinObservations": 3,
                "estimateSpaceMinObservationAngle": 10.0,
                "maxInputPoints": 50000000,
                "maxPoints": 5000000,
                "maxPointsPerVoxel": 1000000,
                "minStep": 2,
                "partitioning": "singleBlock",
                "repartition": "multiResolution",
                "angleFactor": 15.0,
                "simFactor": 15.0,
                "minVis": 2,
                "pixSizeMarginInitCoef": 2.0,
                "pixSizeMarginFinalCoef": 4.0,
                "voteMarginFactor": 4.0,
                "contributeMarginFactor": 2.0,
                "simGaussianSizeInit": 10.0,
                "simGaussianSize": 10.0,
                "minAngleThreshold": 1.0,
                "refineFuse": true,
                "helperPointsGridSize": 10,
                "densify": false,
                "densifyNbFront": 1,
                "densifyNbBack": 1,
                "densifyScale": 20.0,
                "nPixelSizeBehind": 4.0,
                "fullWeight": 1.0,
                "voteFilteringForWeaklySupportedSurfaces": true,
                "addLandmarksToTheDensePointCloud": false,
                "invertTetrahedronBasedOnNeighborsNbIterations": 10,
                "minSolidAngleRatio": 0.2,
                "nbSolidAngleFilteringIterations": 2,
                "colorizeOutput": false,
                "addMaskHelperPoints": false,
                "maskHelperPointsWeight": 1.0,
                "maskBorderSize": 4,
                "maxNbConnectedHelperPoints": 50,
                "saveRawDensePointCloud": false,
                "exportDebugTetrahedralization": false,
                "seed": 0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "outputMesh": "{cache}/{nodeType}/{uid0}/mesh.{outputMeshFileTypeValue}",
                "output": "{cache}/{nodeType}/{uid0}/densePointCloud.abc"
            }
        },
        "DepthMapFilter_1": {
            "nodeType": "DepthMapFilter",
            "position": [
                1400,
                0
            ],
            "parallelization": {
                "blockSize": 24,
                "size": 471,
                "split": 20
            },
            "uids": {
                "0": "8ef36dc7bc7f1fb9ed8e5bb4779160a8bec5110d"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{DepthMap_1.input}",
                "depthMapsFolder": "{DepthMap_1.output}",
                "minViewAngle": 2.0,
                "maxViewAngle": 70.0,
                "nNearestCams": 10,
                "minNumOfConsistentCams": 3,
                "minNumOfConsistentCamsWithLowSimilarity": 4,
                "pixToleranceFactor": 2.0,
                "pixSizeBall": 0,
                "pixSizeBallWithLowSimilarity": 0,
                "computeNormalMaps": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "depth": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap.exr",
                "sim": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_simMap.exr"
            }
        },
        "ImageMatching_1": {
            "nodeType": "ImageMatching",
            "position": [
                400,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 471,
                "split": 1
            },
            "uids": {
                "0": "6b550069c26329b8135e484255601fb69cf4676e"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{FeatureExtraction_1.input}",
                "featuresFolders": [
                    "{FeatureExtraction_1.output}"
                ],
                "method": "SequentialAndVocabularyTree",
                "tree": "${ALICEVISION_VOCTREE}",
                "weights": "",
                "minNbImages": 200,
                "maxDescriptors": 500,
                "nbMatches": 40,
                "nbNeighbors": 5,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/imageMatches.txt"
            }
        },
        "FeatureExtraction_1": {
            "nodeType": "FeatureExtraction",
            "position": [
                200,
                0
            ],
            "parallelization": {
                "blockSize": 40,
                "size": 471,
                "split": 12
            },
            "uids": {
                "0": "5c68a583c5e7573bbf35259a8ba5825d54c33d86"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{CameraInit_1.output}",
                "masksFolder": "",
                "maskExtension": "png",
                "maskInvert": false,
                "describerTypes": [
                    "dspsift"
                ],
                "describerPreset": "normal",
                "maxNbFeatures": 0,
                "describerQuality": "normal",
                "contrastFiltering": "GridSort",
                "relativePeakThreshold": 0.01,
                "gridFiltering": true,
                "workingColorSpace": "sRGB",
                "forceCpuExtraction": true,
                "maxThreads": 0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/"
            }
        },
        "StructureFromMotion_1": {
            "nodeType": "StructureFromMotion",
            "position": [
                800,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 471,
                "split": 1
            },
            "uids": {
                "0": "6134e9e839f7223d14819e2da1cf90cf3a999ebe"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{FeatureMatching_1.input}",
                "featuresFolders": "{FeatureMatching_1.featuresFolders}",
                "matchesFolders": [
                    "{FeatureMatching_1.output}"
                ],
                "describerTypes": "{FeatureMatching_1.describerTypes}",
                "localizerEstimator": "acransac",
                "observationConstraint": "Scale",
                "localizerEstimatorMaxIterations": 4096,
                "localizerEstimatorError": 0.0,
                "lockScenePreviouslyReconstructed": false,
                "useLocalBA": true,
                "localBAGraphDistance": 1,
                "nbFirstUnstableCameras": 30,
                "maxImagesPerGroup": 30,
                "bundleAdjustmentMaxOutliers": 50,
                "maxNumberOfMatches": 0,
                "minNumberOfMatches": 0,
                "minInputTrackLength": 2,
                "minNumberOfObservationsForTriangulation": 2,
                "minAngleForTriangulation": 3.0,
                "minAngleForLandmark": 2.0,
                "maxReprojectionError": 4.0,
                "minAngleInitialPair": 5.0,
                "maxAngleInitialPair": 40.0,
                "useOnlyMatchesFromInputFolder": false,
                "useRigConstraint": true,
                "rigMinNbCamerasForCalibration": 20,
                "lockAllIntrinsics": false,
                "minNbCamerasToRefinePrincipalPoint": 3,
                "filterTrackForks": false,
                "computeStructureColor": true,
                "useAutoTransform": true,
                "initialPairA": "",
                "initialPairB": "",
                "interFileExtension": ".abc",
                "logIntermediateSteps": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/sfm.abc",
                "outputViewsAndPoses": "{cache}/{nodeType}/{uid0}/cameras.sfm",
                "extraInfoFolder": "{cache}/{nodeType}/{uid0}/"
            }
        },
        "PrepareDenseScene_1": {
            "nodeType": "PrepareDenseScene",
            "position": [
                1000,
                0
            ],
            "parallelization": {
                "blockSize": 40,
                "size": 471,
                "split": 12
            },
            "uids": {
                "0": "8e3c0b2966564921603602656d4b9e6c70aa60ff"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{StructureFromMotion_1.output}",
                "imagesFolders": [],
                "masksFolders": [],
                "maskExtension": "png",
                "outputFileType": "exr",
                "saveMetadata": true,
                "saveMatricesTxtFiles": false,
                "evCorrection": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "undistorted": "{cache}/{nodeType}/{uid0}/<VIEW_ID>.{outputFileTypeValue}"
            }
        },
        "CameraInit_1": {
            "nodeType": "CameraInit",
            "position": [
                0,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 471,
                "split": 1
            },
            "uids": {
                "0": "b5483bef2ee92723720762112d9f4a8f006a9142"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "viewpoints": [
                    {
                        "viewId": 28531450,
                        "poseId": 28531450,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame60.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 28978285,
                        "poseId": 28978285,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame79.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 30054572,
                        "poseId": 30054572,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame329.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 30969912,
                        "poseId": 30969912,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame61.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 34740199,
                        "poseId": 34740199,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame312.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 35421336,
                        "poseId": 35421336,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame328.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 35423680,
                        "poseId": 35423680,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame313.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 45346087,
                        "poseId": 45346087,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame235.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 47752111,
                        "poseId": 47752111,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame324.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 52866373,
                        "poseId": 52866373,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame239.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 55053514,
                        "poseId": 55053514,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame238.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 60823139,
                        "poseId": 60823139,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame237.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 61160750,
                        "poseId": 61160750,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame234.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 65799229,
                        "poseId": 65799229,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame236.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 67171753,
                        "poseId": 67171753,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame102.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 68926602,
                        "poseId": 68926602,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame103.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 71156788,
                        "poseId": 71156788,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame105.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 71946186,
                        "poseId": 71946186,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame327.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 74400298,
                        "poseId": 74400298,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame326.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 75994757,
                        "poseId": 75994757,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame106.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 77316084,
                        "poseId": 77316084,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame107.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 78729933,
                        "poseId": 78729933,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame325.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 83508716,
                        "poseId": 83508716,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame104.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 90586369,
                        "poseId": 90586369,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame108.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 92208979,
                        "poseId": 92208979,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame51.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 96826009,
                        "poseId": 96826009,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame101.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 97533119,
                        "poseId": 97533119,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame100.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 106131753,
                        "poseId": 106131753,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame52.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 106843816,
                        "poseId": 106843816,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame50.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 109233208,
                        "poseId": 109233208,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame213.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 110466467,
                        "poseId": 110466467,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame215.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 110938157,
                        "poseId": 110938157,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame214.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 122675766,
                        "poseId": 122675766,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame217.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 125125336,
                        "poseId": 125125336,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame216.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 164003255,
                        "poseId": 164003255,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame317.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 169096327,
                        "poseId": 169096327,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame367.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 179061950,
                        "poseId": 179061950,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame366.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 195893704,
                        "poseId": 195893704,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame41.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 201551044,
                        "poseId": 201551044,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame43.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 204851431,
                        "poseId": 204851431,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame42.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 214018768,
                        "poseId": 214018768,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame40.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 218983709,
                        "poseId": 218983709,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame170.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 220125103,
                        "poseId": 220125103,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame46.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 222943684,
                        "poseId": 222943684,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame45.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 224974560,
                        "poseId": 224974560,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame44.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 235200387,
                        "poseId": 235200387,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame318.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 238686383,
                        "poseId": 238686383,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame63.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 240009292,
                        "poseId": 240009292,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame64.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 240190079,
                        "poseId": 240190079,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame66.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 240632771,
                        "poseId": 240632771,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame65.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 241661681,
                        "poseId": 241661681,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame62.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 243239843,
                        "poseId": 243239843,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame78.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 253540468,
                        "poseId": 253540468,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame76.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 255794849,
                        "poseId": 255794849,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame77.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 262461669,
                        "poseId": 262461669,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame319.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 267283454,
                        "poseId": 267283454,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame74.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 267488622,
                        "poseId": 267488622,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame75.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 307559079,
                        "poseId": 307559079,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame460.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 310442431,
                        "poseId": 310442431,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame461.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 321820492,
                        "poseId": 321820492,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame462.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 336552145,
                        "poseId": 336552145,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame332.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 337187425,
                        "poseId": 337187425,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame331.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 340736639,
                        "poseId": 340736639,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame333.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 341785447,
                        "poseId": 341785447,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame446.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 343829511,
                        "poseId": 343829511,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame447.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 352546632,
                        "poseId": 352546632,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame276.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 353163664,
                        "poseId": 353163664,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame277.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 354782865,
                        "poseId": 354782865,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame279.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 355107669,
                        "poseId": 355107669,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame139.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 356138844,
                        "poseId": 356138844,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame443.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 357622776,
                        "poseId": 357622776,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame278.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 360357052,
                        "poseId": 360357052,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame334.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 363369386,
                        "poseId": 363369386,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame335.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 377384666,
                        "poseId": 377384666,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame137.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 377921806,
                        "poseId": 377921806,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame231.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 378056512,
                        "poseId": 378056512,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame444.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 379106790,
                        "poseId": 379106790,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame49.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 379863358,
                        "poseId": 379863358,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame48.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 380151696,
                        "poseId": 380151696,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame445.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 383165107,
                        "poseId": 383165107,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame138.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 384648517,
                        "poseId": 384648517,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame442.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 387626071,
                        "poseId": 387626071,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame448.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 396894163,
                        "poseId": 396894163,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame230.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 399674118,
                        "poseId": 399674118,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame233.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 399717847,
                        "poseId": 399717847,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame336.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 401611409,
                        "poseId": 401611409,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame337.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 401803630,
                        "poseId": 401803630,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame232.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 402744329,
                        "poseId": 402744329,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame435.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 404055359,
                        "poseId": 404055359,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame206.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 406906200,
                        "poseId": 406906200,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame436.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 411798668,
                        "poseId": 411798668,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame438.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 413164761,
                        "poseId": 413164761,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame437.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 417351805,
                        "poseId": 417351805,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame207.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 418760852,
                        "poseId": 418760852,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame439.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 447529639,
                        "poseId": 447529639,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame158.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 451291922,
                        "poseId": 451291922,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame159.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 458292886,
                        "poseId": 458292886,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame19.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 487027095,
                        "poseId": 487027095,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame314.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 490605153,
                        "poseId": 490605153,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame315.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 494192468,
                        "poseId": 494192468,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame429.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 494465385,
                        "poseId": 494465385,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame428.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 505960397,
                        "poseId": 505960397,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame342.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 506948959,
                        "poseId": 506948959,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame343.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 511698710,
                        "poseId": 511698710,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame341.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 512761770,
                        "poseId": 512761770,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame122.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 514720317,
                        "poseId": 514720317,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame311.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 515514491,
                        "poseId": 515514491,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame310.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 516095249,
                        "poseId": 516095249,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame121.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 516357712,
                        "poseId": 516357712,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame120.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 517546670,
                        "poseId": 517546670,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame340.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 518285018,
                        "poseId": 518285018,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame109.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 518952327,
                        "poseId": 518952327,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame316.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 533032502,
                        "poseId": 533032502,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame208.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 534338863,
                        "poseId": 534338863,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame209.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 536031117,
                        "poseId": 536031117,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame344.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 539532734,
                        "poseId": 539532734,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame246.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 543043803,
                        "poseId": 543043803,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame245.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 544771410,
                        "poseId": 544771410,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame244.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 545348610,
                        "poseId": 545348610,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame148.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 549414295,
                        "poseId": 549414295,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame469.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 555319438,
                        "poseId": 555319438,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame393.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 573144255,
                        "poseId": 573144255,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame146.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 573584015,
                        "poseId": 573584015,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame145.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 574047937,
                        "poseId": 574047937,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame144.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 577586774,
                        "poseId": 577586774,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame149.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 592170711,
                        "poseId": 592170711,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame241.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 597631376,
                        "poseId": 597631376,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame243.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 598485424,
                        "poseId": 598485424,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame242.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 606652960,
                        "poseId": 606652960,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame173.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 607138961,
                        "poseId": 607138961,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame172.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 618593956,
                        "poseId": 618593956,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame175.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 627175210,
                        "poseId": 627175210,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame171.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 633518862,
                        "poseId": 633518862,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame147.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 663198667,
                        "poseId": 663198667,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame177.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 665071819,
                        "poseId": 665071819,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame176.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 670821564,
                        "poseId": 670821564,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame174.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 672652618,
                        "poseId": 672652618,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame285.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 672863131,
                        "poseId": 672863131,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame286.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 674215968,
                        "poseId": 674215968,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame195.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 674755697,
                        "poseId": 674755697,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame27.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 677963648,
                        "poseId": 677963648,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame194.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 681852586,
                        "poseId": 681852586,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame198.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 683226007,
                        "poseId": 683226007,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame283.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 684444599,
                        "poseId": 684444599,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame284.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 686091610,
                        "poseId": 686091610,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame370.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 688154321,
                        "poseId": 688154321,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame88.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 689525911,
                        "poseId": 689525911,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame89.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 691009489,
                        "poseId": 691009489,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame282.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 692175877,
                        "poseId": 692175877,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame287.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 695267877,
                        "poseId": 695267877,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame196.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 696316735,
                        "poseId": 696316735,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame371.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 700433174,
                        "poseId": 700433174,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame372.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 700944441,
                        "poseId": 700944441,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame192.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 701580223,
                        "poseId": 701580223,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame197.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 724394931,
                        "poseId": 724394931,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame193.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 771299976,
                        "poseId": 771299976,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame263.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 775674799,
                        "poseId": 775674799,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame190.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 776177938,
                        "poseId": 776177938,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame267.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 776216707,
                        "poseId": 776216707,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame266.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 778489098,
                        "poseId": 778489098,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame191.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 778548831,
                        "poseId": 778548831,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame264.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 781287761,
                        "poseId": 781287761,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame265.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 783138067,
                        "poseId": 783138067,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame262.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 784921751,
                        "poseId": 784921751,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame26.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 791667198,
                        "poseId": 791667198,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame268.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 792727664,
                        "poseId": 792727664,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame29.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 795649385,
                        "poseId": 795649385,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame28.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 803517795,
                        "poseId": 803517795,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame288.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 810198300,
                        "poseId": 810198300,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame113.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 811409618,
                        "poseId": 811409618,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame69.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 817469461,
                        "poseId": 817469461,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame34.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 818319163,
                        "poseId": 818319163,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame10.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 820905650,
                        "poseId": 820905650,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame11.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 822263608,
                        "poseId": 822263608,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame39.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 823538995,
                        "poseId": 823538995,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame37.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 829049733,
                        "poseId": 829049733,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame33.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 836612083,
                        "poseId": 836612083,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame35.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 837525068,
                        "poseId": 837525068,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame38.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 838722640,
                        "poseId": 838722640,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame36.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 860527150,
                        "poseId": 860527150,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame80.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 864810314,
                        "poseId": 864810314,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame67.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 865594889,
                        "poseId": 865594889,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame68.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 889204867,
                        "poseId": 889204867,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame300.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 902294514,
                        "poseId": 902294514,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame301.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 908494615,
                        "poseId": 908494615,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame115.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 918738918,
                        "poseId": 918738918,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame296.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 924275644,
                        "poseId": 924275644,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame114.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 925377839,
                        "poseId": 925377839,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame297.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 928405178,
                        "poseId": 928405178,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame299.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 930907230,
                        "poseId": 930907230,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame298.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 931540556,
                        "poseId": 931540556,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame321.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 933907424,
                        "poseId": 933907424,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame112.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 934531524,
                        "poseId": 934531524,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame110.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 934771345,
                        "poseId": 934771345,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame111.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 938261213,
                        "poseId": 938261213,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame323.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 939206154,
                        "poseId": 939206154,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame322.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 942802376,
                        "poseId": 942802376,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame320.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 944129744,
                        "poseId": 944129744,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame188.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 945333196,
                        "poseId": 945333196,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame189.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 945765518,
                        "poseId": 945765518,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame302.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 980879293,
                        "poseId": 980879293,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame123.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 981022859,
                        "poseId": 981022859,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame126.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 987695446,
                        "poseId": 987695446,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame124.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 987805185,
                        "poseId": 987805185,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame127.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 993903862,
                        "poseId": 993903862,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame125.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1000266608,
                        "poseId": 1000266608,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame129.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1002600185,
                        "poseId": 1002600185,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame128.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1008530225,
                        "poseId": 1008530225,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame466.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1009199228,
                        "poseId": 1009199228,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame464.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1012223083,
                        "poseId": 1012223083,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame467.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1014072530,
                        "poseId": 1014072530,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame468.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1041694916,
                        "poseId": 1041694916,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame398.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1043822160,
                        "poseId": 1043822160,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame178.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1044093876,
                        "poseId": 1044093876,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame179.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1048305445,
                        "poseId": 1048305445,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame395.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1049076845,
                        "poseId": 1049076845,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame397.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1050624039,
                        "poseId": 1050624039,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame394.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1050717738,
                        "poseId": 1050717738,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame396.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1050775078,
                        "poseId": 1050775078,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame186.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1052637839,
                        "poseId": 1052637839,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame185.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1052974616,
                        "poseId": 1052974616,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame187.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1055152894,
                        "poseId": 1055152894,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame247.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1069725499,
                        "poseId": 1069725499,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame465.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1072142004,
                        "poseId": 1072142004,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame399.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1072340907,
                        "poseId": 1072340907,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame463.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1075746634,
                        "poseId": 1075746634,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame294.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1076088150,
                        "poseId": 1076088150,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame295.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1076952072,
                        "poseId": 1076952072,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame293.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1099780320,
                        "poseId": 1099780320,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame291.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1101489580,
                        "poseId": 1101489580,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame290.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1104695665,
                        "poseId": 1104695665,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame292.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1121466958,
                        "poseId": 1121466958,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame218.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1127964726,
                        "poseId": 1127964726,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame219.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1143435178,
                        "poseId": 1143435178,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame97.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1146831598,
                        "poseId": 1146831598,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame96.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1162224339,
                        "poseId": 1162224339,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame349.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1163617126,
                        "poseId": 1163617126,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame348.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1166327660,
                        "poseId": 1166327660,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame99.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1167649107,
                        "poseId": 1167649107,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame98.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1178070969,
                        "poseId": 1178070969,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame351.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1182148334,
                        "poseId": 1182148334,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame199.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1199410991,
                        "poseId": 1199410991,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame350.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1206848170,
                        "poseId": 1206848170,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame95.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1219391490,
                        "poseId": 1219391490,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame57.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1219975090,
                        "poseId": 1219975090,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame56.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1228617184,
                        "poseId": 1228617184,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame360.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1239378354,
                        "poseId": 1239378354,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame430.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1241144298,
                        "poseId": 1241144298,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame431.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1242696843,
                        "poseId": 1242696843,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame392.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1242884354,
                        "poseId": 1242884354,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame347.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1243699362,
                        "poseId": 1243699362,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame346.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1249157774,
                        "poseId": 1249157774,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame390.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1249908770,
                        "poseId": 1249908770,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame391.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1253324034,
                        "poseId": 1253324034,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame364.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1255928639,
                        "poseId": 1255928639,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame345.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1256187317,
                        "poseId": 1256187317,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame150.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1256772442,
                        "poseId": 1256772442,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame365.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1267647673,
                        "poseId": 1267647673,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame169.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1274245695,
                        "poseId": 1274245695,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame168.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1275146183,
                        "poseId": 1275146183,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame167.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1283274903,
                        "poseId": 1283274903,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame165.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1292171348,
                        "poseId": 1292171348,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame20.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1293984949,
                        "poseId": 1293984949,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame21.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1295664596,
                        "poseId": 1295664596,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame22.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1298459240,
                        "poseId": 1298459240,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame361.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1299373372,
                        "poseId": 1299373372,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame363.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1299758803,
                        "poseId": 1299758803,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame362.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1305161009,
                        "poseId": 1305161009,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame166.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1305954736,
                        "poseId": 1305954736,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame23.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1310267620,
                        "poseId": 1310267620,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame59.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1310885300,
                        "poseId": 1310885300,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame386.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1311628516,
                        "poseId": 1311628516,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame58.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1317086510,
                        "poseId": 1317086510,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame24.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1317717598,
                        "poseId": 1317717598,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame2.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1318342903,
                        "poseId": 1318342903,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame381.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1320324448,
                        "poseId": 1320324448,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame383.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1322499927,
                        "poseId": 1322499927,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame143.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1323284110,
                        "poseId": 1323284110,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame141.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1323399470,
                        "poseId": 1323399470,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame140.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1323581811,
                        "poseId": 1323581811,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame3.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1323736696,
                        "poseId": 1323736696,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame382.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1323934836,
                        "poseId": 1323934836,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame380.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1325102475,
                        "poseId": 1325102475,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame1.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1326443433,
                        "poseId": 1326443433,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame384.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1326952530,
                        "poseId": 1326952530,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame53.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1330868845,
                        "poseId": 1330868845,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame25.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1331315103,
                        "poseId": 1331315103,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame385.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1331418914,
                        "poseId": 1331418914,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame55.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1333727721,
                        "poseId": 1333727721,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame4.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1333750311,
                        "poseId": 1333750311,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame54.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1354250593,
                        "poseId": 1354250593,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame338.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1362656405,
                        "poseId": 1362656405,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame142.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1369049933,
                        "poseId": 1369049933,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame471.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1371614603,
                        "poseId": 1371614603,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame470.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1390325544,
                        "poseId": 1390325544,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame339.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1405795738,
                        "poseId": 1405795738,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame449.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1413523823,
                        "poseId": 1413523823,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame410.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1421093310,
                        "poseId": 1421093310,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame411.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1427859669,
                        "poseId": 1427859669,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame272.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1431078217,
                        "poseId": 1431078217,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame274.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1434417523,
                        "poseId": 1434417523,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame273.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1437140558,
                        "poseId": 1437140558,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame275.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1438773154,
                        "poseId": 1438773154,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame270.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1445073444,
                        "poseId": 1445073444,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame271.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1461248643,
                        "poseId": 1461248643,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame269.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1495628105,
                        "poseId": 1495628105,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame405.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1501889347,
                        "poseId": 1501889347,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame401.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1502373120,
                        "poseId": 1502373120,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame406.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1504444037,
                        "poseId": 1504444037,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame400.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1505735104,
                        "poseId": 1505735104,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame403.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1507085479,
                        "poseId": 1507085479,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame404.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1524782970,
                        "poseId": 1524782970,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame227.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1526636176,
                        "poseId": 1526636176,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame407.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1528455296,
                        "poseId": 1528455296,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame228.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1533079146,
                        "poseId": 1533079146,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame289.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1537059375,
                        "poseId": 1537059375,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame409.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1537492137,
                        "poseId": 1537492137,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame408.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1543121960,
                        "poseId": 1543121960,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame229.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1553341877,
                        "poseId": 1553341877,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame240.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1558147869,
                        "poseId": 1558147869,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame414.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1559251274,
                        "poseId": 1559251274,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame260.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1559945405,
                        "poseId": 1559945405,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame415.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1561768986,
                        "poseId": 1561768986,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame261.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1584799338,
                        "poseId": 1584799338,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame402.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1594219716,
                        "poseId": 1594219716,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame416.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1595991900,
                        "poseId": 1595991900,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame417.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1627660062,
                        "poseId": 1627660062,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame251.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1632972461,
                        "poseId": 1632972461,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame388.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1633716463,
                        "poseId": 1633716463,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame252.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1637232402,
                        "poseId": 1637232402,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame253.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1643456648,
                        "poseId": 1643456648,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame389.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1647260970,
                        "poseId": 1647260970,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame163.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1650704854,
                        "poseId": 1650704854,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame161.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1653298662,
                        "poseId": 1653298662,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame356.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1653353040,
                        "poseId": 1653353040,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame456.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1655462924,
                        "poseId": 1655462924,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame457.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1658327501,
                        "poseId": 1658327501,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame358.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1670507791,
                        "poseId": 1670507791,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame164.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1672962254,
                        "poseId": 1672962254,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame162.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1674286607,
                        "poseId": 1674286607,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame160.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1676544566,
                        "poseId": 1676544566,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame458.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1678469656,
                        "poseId": 1678469656,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame459.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1687844965,
                        "poseId": 1687844965,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame9.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1690218467,
                        "poseId": 1690218467,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame8.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1705920442,
                        "poseId": 1705920442,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame5.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1712378675,
                        "poseId": 1712378675,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame7.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1714571667,
                        "poseId": 1714571667,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame6.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1721573006,
                        "poseId": 1721573006,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame226.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1721921389,
                        "poseId": 1721921389,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame86.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1722496470,
                        "poseId": 1722496470,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame224.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1722863191,
                        "poseId": 1722863191,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame81.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1723904574,
                        "poseId": 1723904574,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame254.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1726285970,
                        "poseId": 1726285970,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame250.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1726878806,
                        "poseId": 1726878806,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame225.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1727963742,
                        "poseId": 1727963742,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame87.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1728092725,
                        "poseId": 1728092725,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame82.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1729551748,
                        "poseId": 1729551748,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame83.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1730880300,
                        "poseId": 1730880300,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame434.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1733283469,
                        "poseId": 1733283469,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame223.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1733583250,
                        "poseId": 1733583250,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame222.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1734525654,
                        "poseId": 1734525654,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame220.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1736336538,
                        "poseId": 1736336538,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame221.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1739215929,
                        "poseId": 1739215929,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame387.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1745221732,
                        "poseId": 1745221732,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame47.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1747237197,
                        "poseId": 1747237197,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame84.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1753499537,
                        "poseId": 1753499537,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame305.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1755471681,
                        "poseId": 1755471681,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame307.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1755702172,
                        "poseId": 1755702172,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame304.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1758100110,
                        "poseId": 1758100110,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame433.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1758874427,
                        "poseId": 1758874427,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame85.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1758915103,
                        "poseId": 1758915103,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame432.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1762319479,
                        "poseId": 1762319479,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame330.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1764792200,
                        "poseId": 1764792200,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame94.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1765406467,
                        "poseId": 1765406467,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame303.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1770484637,
                        "poseId": 1770484637,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame91.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1772951300,
                        "poseId": 1772951300,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame423.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1773692128,
                        "poseId": 1773692128,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame90.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1775129895,
                        "poseId": 1775129895,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame306.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1775250928,
                        "poseId": 1775250928,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame422.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1775276919,
                        "poseId": 1775276919,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame92.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1775441569,
                        "poseId": 1775441569,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame93.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1779884273,
                        "poseId": 1779884273,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame309.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1781477302,
                        "poseId": 1781477302,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame18.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1781800058,
                        "poseId": 1781800058,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame308.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1800685516,
                        "poseId": 1800685516,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame12.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1801480956,
                        "poseId": 1801480956,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame13.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1808854681,
                        "poseId": 1808854681,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame440.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1809681707,
                        "poseId": 1809681707,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame441.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1819771540,
                        "poseId": 1819771540,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame259.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1820872116,
                        "poseId": 1820872116,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame258.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1822456851,
                        "poseId": 1822456851,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame14.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1824372845,
                        "poseId": 1824372845,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame281.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1824896196,
                        "poseId": 1824896196,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame17.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1825209049,
                        "poseId": 1825209049,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame425.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1825756429,
                        "poseId": 1825756429,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame15.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1826428628,
                        "poseId": 1826428628,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame426.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1828234600,
                        "poseId": 1828234600,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame16.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1829672511,
                        "poseId": 1829672511,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame421.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1830211028,
                        "poseId": 1830211028,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame424.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1833037626,
                        "poseId": 1833037626,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame280.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1836140009,
                        "poseId": 1836140009,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame204.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1836279308,
                        "poseId": 1836279308,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame427.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1846521664,
                        "poseId": 1846521664,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame202.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1848185156,
                        "poseId": 1848185156,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame203.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1855120617,
                        "poseId": 1855120617,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame205.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1856539475,
                        "poseId": 1856539475,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame200.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1861040674,
                        "poseId": 1861040674,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame201.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1873867005,
                        "poseId": 1873867005,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame255.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1874446037,
                        "poseId": 1874446037,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame257.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1874613154,
                        "poseId": 1874613154,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame256.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1896975152,
                        "poseId": 1896975152,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame72.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1897024024,
                        "poseId": 1897024024,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame73.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1897647903,
                        "poseId": 1897647903,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame183.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1898116886,
                        "poseId": 1898116886,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame184.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1905621494,
                        "poseId": 1905621494,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame180.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1907830410,
                        "poseId": 1907830410,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame181.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1908604899,
                        "poseId": 1908604899,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame70.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1909499066,
                        "poseId": 1909499066,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame182.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1911888489,
                        "poseId": 1911888489,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame71.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1938092020,
                        "poseId": 1938092020,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame210.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1940264908,
                        "poseId": 1940264908,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame211.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1945317872,
                        "poseId": 1945317872,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame212.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1965192021,
                        "poseId": 1965192021,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame419.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1972036839,
                        "poseId": 1972036839,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame412.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1972083977,
                        "poseId": 1972083977,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame249.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1972235731,
                        "poseId": 1972235731,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame248.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1975909490,
                        "poseId": 1975909490,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame418.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1978544813,
                        "poseId": 1978544813,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame413.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1998527084,
                        "poseId": 1998527084,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame369.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2008196400,
                        "poseId": 2008196400,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame368.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2020317779,
                        "poseId": 2020317779,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame378.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2023126095,
                        "poseId": 2023126095,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame374.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2024762161,
                        "poseId": 2024762161,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame116.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2029263815,
                        "poseId": 2029263815,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame373.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2029326337,
                        "poseId": 2029326337,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame420.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2030687873,
                        "poseId": 2030687873,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame118.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2032966634,
                        "poseId": 2032966634,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame119.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2035126263,
                        "poseId": 2035126263,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame117.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2039291699,
                        "poseId": 2039291699,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame379.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2040652381,
                        "poseId": 2040652381,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame32.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2065701511,
                        "poseId": 2065701511,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame157.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2067250175,
                        "poseId": 2067250175,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame155.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2067438901,
                        "poseId": 2067438901,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame156.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2071137864,
                        "poseId": 2071137864,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame154.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2071587583,
                        "poseId": 2071587583,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame153.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2074518637,
                        "poseId": 2074518637,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame152.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2077170236,
                        "poseId": 2077170236,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame151.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2082737869,
                        "poseId": 2082737869,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame353.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2083207906,
                        "poseId": 2083207906,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame355.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2085489062,
                        "poseId": 2085489062,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame354.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2086272894,
                        "poseId": 2086272894,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame352.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2087959275,
                        "poseId": 2087959275,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame357.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2095913543,
                        "poseId": 2095913543,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame135.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2101605984,
                        "poseId": 2101605984,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame136.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2104796759,
                        "poseId": 2104796759,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame134.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2107795347,
                        "poseId": 2107795347,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame131.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2108626645,
                        "poseId": 2108626645,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame130.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2112397712,
                        "poseId": 2112397712,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame133.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2113055274,
                        "poseId": 2113055274,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame132.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2114403589,
                        "poseId": 2114403589,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame451.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2115178513,
                        "poseId": 2115178513,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame453.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2115477492,
                        "poseId": 2115477492,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame450.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2117096263,
                        "poseId": 2117096263,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame452.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2118372128,
                        "poseId": 2118372128,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame359.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2118959901,
                        "poseId": 2118959901,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame455.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2121094510,
                        "poseId": 2121094510,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame454.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2126841928,
                        "poseId": 2126841928,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame30.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2128589428,
                        "poseId": 2128589428,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame31.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2133744623,
                        "poseId": 2133744623,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame376.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2134206936,
                        "poseId": 2134206936,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame375.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2147122593,
                        "poseId": 2147122593,
                        "path": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out/frame377.jpg",
                        "intrinsicId": 1885747511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    }
                ],
                "intrinsics": [
                    {
                        "intrinsicId": 1885747511,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 816,
                        "height": 624,
                        "sensorWidth": 36.0,
                        "sensorHeight": 24.0,
                        "serialNumber": "C:/Users/Avidh Bavkar/OneDrive - purdue.edu/PETAL/PETAL_Photogrammetry/Scripts/Camera_Experiments/out",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    }
                ],
                "sensorDatabase": "${ALICEVISION_SENSOR_DB}",
                "lensCorrectionProfileInfo": "${ALICEVISION_LENS_PROFILE_INFO}",
                "lensCorrectionProfileSearchIgnoreCameraModel": true,
                "defaultFieldOfView": 45.0,
                "groupCameraFallback": "folder",
                "allowedCameraModels": [
                    "pinhole",
                    "radial1",
                    "radial3",
                    "brown",
                    "fisheye4",
                    "fisheye1",
                    "3deanamorphic4",
                    "3deradial4",
                    "3declassicld"
                ],
                "rawColorInterpretation": "LibRawWhiteBalancing",
                "colorProfileDatabase": "${ALICEVISION_COLOR_PROFILE_DB}",
                "errorOnMissingColorProfile": true,
                "viewIdMethod": "metadata",
                "viewIdRegex": ".*?(\\d+)",
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/cameraInit.sfm"
            }
        },
        "DepthMap_1": {
            "nodeType": "DepthMap",
            "position": [
                1200,
                0
            ],
            "parallelization": {
                "blockSize": 12,
                "size": 471,
                "split": 40
            },
            "uids": {
                "0": "b4c331b9d680327a3c19c76ed2cf1434735bb201"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{PrepareDenseScene_1.input}",
                "imagesFolder": "{PrepareDenseScene_1.output}",
                "downscale": 2,
                "minViewAngle": 2.0,
                "maxViewAngle": 70.0,
                "tiling": {
                    "tileBufferWidth": 1024,
                    "tileBufferHeight": 1024,
                    "tilePadding": 64,
                    "autoAdjustSmallImage": true
                },
                "chooseTCamsPerTile": true,
                "maxTCams": 10,
                "sgm": {
                    "sgmScale": 2,
                    "sgmStepXY": 2,
                    "sgmStepZ": -1,
                    "sgmMaxTCamsPerTile": 4,
                    "sgmWSH": 4,
                    "sgmUseSfmSeeds": true,
                    "sgmSeedsRangeInflate": 0.2,
                    "sgmDepthThicknessInflate": 0.0,
                    "sgmMaxSimilarity": 1.0,
                    "sgmGammaC": 5.5,
                    "sgmGammaP": 8.0,
                    "sgmP1": 10.0,
                    "sgmP2Weighting": 100.0,
                    "sgmMaxDepths": 1500,
                    "sgmFilteringAxes": "YX",
                    "sgmDepthListPerTile": true,
                    "sgmUseConsistentScale": false
                },
                "refine": {
                    "refineEnabled": true,
                    "refineScale": 1,
                    "refineStepXY": 1,
                    "refineMaxTCamsPerTile": 4,
                    "refineSubsampling": 10,
                    "refineHalfNbDepths": 15,
                    "refineWSH": 3,
                    "refineSigma": 15.0,
                    "refineGammaC": 15.5,
                    "refineGammaP": 8.0,
                    "refineInterpolateMiddleDepth": false,
                    "refineUseConsistentScale": false
                },
                "colorOptimization": {
                    "colorOptimizationEnabled": true,
                    "colorOptimizationNbIterations": 100
                },
                "customPatchPattern": {
                    "sgmUseCustomPatchPattern": false,
                    "refineUseCustomPatchPattern": false,
                    "customPatchPatternSubparts": [],
                    "customPatchPatternGroupSubpartsPerLevel": false
                },
                "intermediateResults": {
                    "exportIntermediateDepthSimMaps": false,
                    "exportIntermediateNormalMaps": false,
                    "exportIntermediateVolumes": false,
                    "exportIntermediateCrossVolumes": false,
                    "exportIntermediateTopographicCutVolumes": false,
                    "exportIntermediateVolume9pCsv": false,
                    "exportTilePattern": false
                },
                "nbGPUs": 0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "depth": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap.exr",
                "sim": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_simMap.exr",
                "tilePattern": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_tilePattern.obj",
                "depthSgm": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap_sgm.exr",
                "depthSgmUpscaled": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap_sgmUpscaled.exr",
                "depthRefined": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap_refinedFused.exr"
            }
        },
        "MeshFiltering_1": {
            "nodeType": "MeshFiltering",
            "position": [
                1800,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "79d4a93d1a763476dabee0631873c5e342a3cef6"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "inputMesh": "{Meshing_1.outputMesh}",
                "outputMeshFileType": "obj",
                "keepLargestMeshOnly": false,
                "smoothingSubset": "all",
                "smoothingBoundariesNeighbours": 0,
                "smoothingIterations": 5,
                "smoothingLambda": 1.0,
                "filteringSubset": "all",
                "filteringIterations": 1,
                "filterLargeTrianglesFactor": 60.0,
                "filterTrianglesRatio": 0.0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "outputMesh": "{cache}/{nodeType}/{uid0}/mesh.{outputMeshFileTypeValue}"
            }
        },
        "FeatureMatching_1": {
            "nodeType": "FeatureMatching",
            "position": [
                600,
                0
            ],
            "parallelization": {
                "blockSize": 20,
                "size": 471,
                "split": 24
            },
            "uids": {
                "0": "75d97128ab4bc3bb6f618549006c33c9dca842e8"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{ImageMatching_1.input}",
                "featuresFolders": "{ImageMatching_1.featuresFolders}",
                "imagePairsList": "{ImageMatching_1.output}",
                "describerTypes": "{FeatureExtraction_1.describerTypes}",
                "photometricMatchingMethod": "ANN_L2",
                "geometricEstimator": "acransac",
                "geometricFilterType": "fundamental_matrix",
                "distanceRatio": 0.8,
                "maxIteration": 2048,
                "geometricError": 0.0,
                "knownPosesGeometricErrorMax": 5.0,
                "minRequired2DMotion": -1.0,
                "maxMatches": 0,
                "savePutativeMatches": false,
                "crossMatching": false,
                "guidedMatching": false,
                "matchFromKnownCameraPoses": false,
                "exportDebugFiles": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/"
            }
        }
    }
}