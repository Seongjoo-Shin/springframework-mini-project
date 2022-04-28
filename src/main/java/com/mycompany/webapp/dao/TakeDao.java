package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.BuildingDto;
import com.mycompany.webapp.dto.BuildingFileDto;
import com.mycompany.webapp.dto.EquipmentDto;

@Mapper
public interface TakeDao {

	//매물등록할 때 실행
	int insertBuilding(BuildingDto bdt);
	void insertEquipments(EquipmentDto edto);
	void insertImageFile(BuildingFileDto bfd);

}
