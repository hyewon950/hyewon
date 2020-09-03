package common;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionTemplate {

		public static SqlSession getSqlSession() {
			SqlSession session = null;
			String resource = "mybatis-config.xml";
			
			try {
				// 해당 리소스 경로(xml 파일)을 바탕으로 input 스트림 생성
				InputStream is = Resources.getResourceAsStream(resource);
				// SqlSessionFactory를 만들 수 있는 팩토리 빌더 생성
				SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
				// 팩토리 빌더를 가지고 실제 사용할 SqlSessionFactory 생성
				SqlSessionFactory factory = builder.build(is);
				// SqlSessionFactory를 가지고 SqlSession 생성 후 리턴
				session = factory.openSession(false); // 오토커밋 해제
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return session;
		}

	}
	

