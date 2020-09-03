package org.kh.camp.chat.controller;

import java.util.List;

import org.kh.camp.chat.domain.ChatRoom;
import org.kh.camp.chat.domain.Message;
import org.kh.camp.chat.service.chatService;
import org.kh.camp.used.domain.UsedBoard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes({"chatList"})
//@SessionAttributes({"chatroom"})
@Controller("chatController")
public class ChatController {

	@Autowired
	private chatService cService;
	
	// 채팅 페이지로 이동
		@RequestMapping("chatView.do")
		public String chatView(int chatRoomNo,String receiver, Model model) {
			
			List<Message> chatList = cService.getRoomMessageList(chatRoomNo);
			model.addAttribute("chatList",chatList);
			System.out.println("컨트롤러 chatList : " + chatList);
			
			ChatRoom chatRoom = cService.isRoom2(chatRoomNo);
			model.addAttribute("chatRoom",chatRoom);
			
			if(chatList != null || chatList.size() >= 1) {
				System.out.println("채팅뷰에서 내용있다ㅏㅏㅏ");
				Message messageVo = new Message();
				messageVo.setChatRoomNo(chatRoomNo);
				messageVo.setReceiver(receiver);
				System.out.println("하하ㅏ하하하하");
				
				cService.updateReadtime(messageVo); //안읽은 내용 읽음으로
			}else {
				System.out.println("채팅내용없다ㅏㅏ");
			}
			
			return "chat/chatView2";
		}

		// 채팅방으로 이동
		@RequestMapping("chatRoomView.do")
		public String chatRoomView(String mId, Model model) {
			System.out.println("채팅방 유저 :" + mId);
			
			try { //service에 throws Exception을 써줬기 때문에 try캐치문을 써야한다.
				List<Message> chatList  = cService.getListMessageList(mId);
				
				model.addAttribute("chatList", chatList);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "chat/chatRoom";
		}
		
		//중고거래에서 채팅하기 클릭시
		@RequestMapping("createChatRoom.do")
		public String createChatRoom(String usedId,String usedTitle,int usedNo,String loginUser ) {
			
			Message messageVo = new Message();//메시지
			messageVo.setmId(loginUser);
			messageVo.setUsedId(usedId);
			messageVo.setTitle(usedTitle);
			messageVo.setUsedNo(usedNo);
			
			ChatRoom chatRoomVo = new ChatRoom(); //채팅방
			chatRoomVo.setmId(loginUser);
			chatRoomVo.setUsedId(usedId);
			chatRoomVo.setTitle(usedTitle);
			chatRoomVo.setUsedNo(usedNo);
			
			
			ChatRoom chatRoomNoCheck = new ChatRoom();
			chatRoomNoCheck = cService.getChatRoomNo(chatRoomVo); //방이있는지확인
			System.out.println("컨트롤러 a");
			
			if(chatRoomNoCheck != null) {
				//원래 방이 있다
				System.out.println("컨트롤러 F");
				return "redirect:chatView.do?chatRoomNo="+chatRoomNoCheck.getChatroomNo()+"& receiver=" + loginUser;
				
			}else { 
				//방이 없으면
				System.out.println("컨트롤러 B");
				int chatRoomResult = cService.createChatRoom(messageVo); //채팅방 생성
				
				System.out.println("컨트롤러 c");
				
				if (chatRoomResult > 0) { //채팅방 생성이 성공한 후
					System.out.println("컨트롤러 D");
					chatRoomNoCheck = cService.getChatRoomNo(chatRoomVo);
					return "redirect:chatView.do?chatRoomNo="+chatRoomNoCheck.getChatroomNo()+"& receiver=" + loginUser;
					
				}else {
					System.out.println("컨트롤러 E");
					return "common/errorPage";
				}
			}
			
			
			
		}
		
	
	
}
