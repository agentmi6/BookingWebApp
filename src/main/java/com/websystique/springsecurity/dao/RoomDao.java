package com.websystique.springsecurity.dao;

import java.util.List;

import com.websystique.springsecurity.model.Room;

public interface RoomDao {

	public List<Room> getAllRooms();

	public void saveRoom(Room room);

	public Room getRoom(int roomId);

	public void deleteRoom(int roomId);

}
