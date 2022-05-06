package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.BuildingDto;
import com.mycompany.webapp.dto.BuildingFileDto;
import com.mycompany.webapp.dto.EquipmentDto;
import com.mycompany.webapp.dto.LikeListDto;
import com.mycompany.webapp.dto.MessageDto;

@Mapper
public interface TakeDao {

	//매물등록할 때 실행
	int insertBuilding(BuildingDto bdt);
	void insertEquipments(EquipmentDto edto);
	void insertImageFile(BuildingFileDto bfd);
	List<BuildingDto> selectBuildingList();
	
	List<BuildingFileDto> selectBuildingFiles();
	List<BuildingFileDto> selectImageFileByBuildingNo(String buildingNo);
	
	BuildingDto selectBuildingByBuildingNo(String buildingNo);
	List<EquipmentDto> selectEquipmentByBuildingNo(String buildingNo);
	int insertMessage(MessageDto message);
	int buildingFilesCount(String buildingNo);
	int selectLikeListByBuildingNo(LikeListDto lld);
	
	void insertLikeLists(LikeListDto lld);
	void deleteLikeLists(LikeListDto lld);
	void updateLikeCount(BuildingDto bdt);
	
	
	void deleteEquipments(int buildingNo);
	void deleteBuildingImagesByImageNo(int imgNo);
	
	void updateBuilding(BuildingDto bdt);
	void deleteBuildingByNo(int buildingNo);
	void updateBuildingUseYN(int buildingNo);
}
