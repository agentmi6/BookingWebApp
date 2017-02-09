package com.websystique.springsecurity.service;

import java.util.List;

import com.websystique.springsecurity.model.Room;

public interface RoomService {

	public List<Room> getAllRooms();

	public void saveRoom(Room room);

	public void deleteRoom(int roomId);

	public Room getRoom(int roomId);
}
