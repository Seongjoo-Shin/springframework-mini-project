package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.TakeDao;
import com.mycompany.webapp.dto.BuildingDto;
import com.mycompany.webapp.dto.BuildingFileDto;
import com.mycompany.webapp.dto.EquipmentDto;

@Service
public class TakeService {
	@Resource
	private TakeDao takeDao;

	public int insertBuilding(BuildingDto bdt) {
		takeDao.insertBuilding(bdt);
		int buildingNo = bdt.getBuildingNo();
		return buildingNo;
	}

	public void insertEquipments(EquipmentDto equip) {
		takeDao.insertEquipments(equip);
	}

	public void insertBuildingFile(BuildingFileDto bfd) {
		takeDao.insertImageFile(bfd);
	}
}
