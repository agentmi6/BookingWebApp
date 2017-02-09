package com.websystique.springsecurity.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.websystique.springsecurity.dao.RoomTypeDao;
import com.websystique.springsecurity.model.RoomType;

@Service
public class RoomTypeServiceImpl implements RoomTypeService {

	@Autowired
	private RoomTypeDao roomTypeDao;

	@Override
	@Transactional
	public List<RoomType> getRoomTypes() {
		return roomTypeDao.getRoomTypes();
	}

	@Override
	@Transactional
	public void saveRoomType(RoomType roomType) {
		roomTypeDao.saveRoomType(roomType);

	}

	@Override
	@Transactional
	public RoomType getRoomType(int roomTypeId) {
		return roomTypeDao.getRoomType(roomTypeId);
	}

	@Override
	@Transactional
	public void deleteRoomType(int roomTypeId) {
		roomTypeDao.deleteRoomType(roomTypeId);

	}

}
