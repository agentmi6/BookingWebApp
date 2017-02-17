package com.web.booking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.booking.dao.RoomDao;
import com.web.booking.model.Room;

@Service
public class RoomServiceImpl implements RoomService {

	@Autowired
	private RoomDao roomDao;

	@Override
	@Transactional
	public List<Room> getAllRooms() {
		return roomDao.getAllRooms();
	}

	@Override
	@Transactional
	public void saveRoom(Room room) {
		roomDao.saveRoom(room);
	}

	@Override
	@Transactional
	public void deleteRoom(int roomId) {
		roomDao.deleteRoom(roomId);

	}

	@Override
	@Transactional
	public Room getRoom(int roomId) {
		return roomDao.getRoom(roomId);
	}

}
