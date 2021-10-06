#!/bin/bash
#SBATCH --account=hpc_p_pomeroy
#SBATCH --nodes=1
#SBATCH --tasks-per-node=16
#SBATCH --time=00:30:00
#SBATCH --job-name=Ost_GEMCaPA_MESH
#SBATCH --output=Ost_GEMCaPA_MESH

# For seq forcing file
[[ -f basin_*.seq ]] && rm basin_*.seq
#
# ln -s /home/zkt451/MESH_Projects/ForcingData/SEQ_Data/BowRiverBanff_GEM_0p125_UTC-6_basin_humidity.seq basin_humidity.seq
# ln -s /home/zkt451/MESH_Projects/ForcingData/SEQ_Data/BowRiverBanff_GEM_0p125_UTC-6_basin_longwave.seq basin_longwave.seq
# ln -s /home/zkt451/MESH_Projects/ForcingData/SEQ_Data/BowRiverBanff_GEM_0p125_UTC-6_basin_pres.seq basin_pres.seq
# ln -s /home/zkt451/MESH_Projects/ForcingData/SEQ_Data/BowRiverBanff_GEM_CaPA_0p125_UTC-6_basin_rain.seq basin_rain.seq
# ln -s /home/zkt451/MESH_Projects/ForcingData/SEQ_Data/BowRiverBanff_GEM_0p125_UTC-6_basin_shortwave.seq basin_shortwave.seq
# ln -s /home/zkt451/MESH_Projects/ForcingData/SEQ_Data/BowRiverBanff_GEM_0p125_UTC-6_basin_temperature.seq basin_temperature.seq
# ln -s /home/zkt451/MESH_Projects/ForcingData/SEQ_Data/BowRiverBanff_GEM_0p125_UTC-6_basin_wind.seq basin_wind.seq
# ln -s /home/zkt451/MESH_Projects/ForcingData/SEQ_Data/BowRiverBanff_GEM_0p125_UTC-6_basin_winddir.seq basin_winddir.seq

ln -s /home/zkt451/MESH_Projects/ForcingData/NC_Data/GEM_0p125_UTC-6_basin_humidity.nc basin_humidity.nc
ln -s /home/zkt451/MESH_Projects/ForcingData/NC_Data/GEM_0p125_UTC-6_basin_longwave.nc basin_longwave.nc
ln -s /home/zkt451/MESH_Projects/ForcingData/NC_Data/GEM_0p125_UTC-6_basin_pres.nc basin_pres.nc
ln -s /home/zkt451/MESH_Projects/ForcingData/NC_Data/GEM_CaPA_0p125_UTC-6_basin_rain.nc basin_rain.nc
ln -s /home/zkt451/MESH_Projects/ForcingData/NC_Data/GEM_0p125_UTC-6_basin_shortwave.nc basin_shortwave.nc
ln -s /home/zkt451/MESH_Projects/ForcingData/NC_Data/GEM_0p125_UTC-6_basin_temperature.nc basin_temperature.nc
ln -s /home/zkt451/MESH_Projects/ForcingData/NC_Data/GEM_0p125_UTC-6_basin_wind.nc basin_wind.nc
ln -s /home/zkt451/MESH_Projects/ForcingData/NC_Data/GEM_0p125_UTC-6_basin_winddir.nc basin_winddir.nc

[[ -f Metrics_Out.txt ]] && rm Metrics_Out.txt

MESH_MPI=/home/zkt451/MESH_Code/ModifiedCode/r1728-ME/mpi_sa_mesh_netcdf
srun $MESH_MPI

if [ ! -f Metrics_Out.txt ] ; then
       cp -p Metrics_BAD.txt Metrics_Out.txt
fi