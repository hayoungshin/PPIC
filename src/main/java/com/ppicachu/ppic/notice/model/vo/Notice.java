package com.ppicachu.ppic.notice.model.vo;

import java.util.ArrayList;

import com.ppicachu.ppic.common.model.vo.Attachment;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Notice {

	private int noticeNo;
	private String noticeTitle;
	private String noticeWriter;
	private String noticeContent;
	private int count;
	private String createDate;
	private String modifyDate;
	private String status;
	private String important;
	private int attachmentCount;
	private ArrayList<Attachment> attList;
	private String profileImg;
	private String userName;
}
