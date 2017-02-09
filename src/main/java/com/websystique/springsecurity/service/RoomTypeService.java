package com.websystique.springsecurity.service;

import java.util.List;

import com.websystique.springsecurity.model.RoomType;

public interface RoomTypeService {

	public List<RoomType> getRoomTypes();

	public void saveRoomType(RoomType roomType);

	public RoomType getRoomType(int roomTypeId);

	public void deleteRoomType(int roomTypeId);
}
