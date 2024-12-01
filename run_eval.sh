echo "NuScenes on NuScenes results"
taskset --c 0-15 ./tools/dist_test_batch_modified.sh configs/regnet/pointpillars_hv_regnet-400mf_fpn_sbn-all_8xb4-2x_nus-3d.py https://download.openmmlab.com/mmdetection3d/v0.1.0_models/regnet/hv_pointpillars_regnet-400mf_fpn_sbn-all_4x8_2x_nus-3d/hv_pointpillars_regnet-400mf_fpn_sbn-all_4x8_2x_nus-3d_20200620_230239-c694dce7.pth 1

# echo "Lyft on NuScenes results"
# taskset --c 0-15 ./tools/dist_test_batch_modified.sh configs/regnet/pointpillars_hv_regnet-400mf_fpn_sbn-all_8xb4-2x_nus-3d.py https://download.openmmlab.com/mmdetection3d/v0.1.0_models/regnet/hv_pointpillars_regnet-400mf_fpn_sbn-all_2x8_2x_lyft-3d/hv_pointpillars_regnet-400mf_fpn_sbn-all_2x8_2x_lyft-3d_20210521_115618-823dcf18.pth 1
