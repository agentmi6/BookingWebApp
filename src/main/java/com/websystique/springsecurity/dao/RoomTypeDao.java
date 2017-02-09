package com.websystique.springsecurity.dao;

import java.util.List;

import com.websystique.springsecurity.model.RoomType;

public interface RoomTypeDao {

	public List<RoomType> getRoomTypes();

	public void saveRoomType(RoomType roomType);

	public RoomType getRoomType(int roomTypeId);

	public void deleteRoomType(int roomTypeId);

}
