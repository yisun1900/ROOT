<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

int count=0;


try {
	//������׼ƾ֤�ļ�
	conn=cf.getConnection();    //�õ�����

	String fgsbh=null;//���ʦ
	String khbh=null;//���ʦ
	String dwbh=null;//���ʦ
	String sjs=null;//���ʦ
	String sjsgh=null;//��������ұ��

	int row=0;
	ls_sql=" select fgsbh,khbh,sjs,dwbh" ;
	ls_sql+=" from crm_khxx " ;
	ls_sql+=" where zt='2' and sjsgh is null and sjs is not null" ;
	ps1= conn.prepareStatement(ls_sql);
	rs1=ps1.executeQuery();
	while(rs1.next())
	{         
		fgsbh = rs1.getString("fgsbh");			    
		khbh = rs1.getString("khbh");			    
		sjs = cf.fillNull(rs1.getString("sjs"));			    
		dwbh = rs1.getString("dwbh");		

		row++;
		out.println("<BR>"+row);
		
		//ȡ���ʦ����
		String bianhao=null;//Ա�����

		//1����鱾����ְ���ʦ
		ls_sql=" select count(*)" ;
		ls_sql+=" from sq_yhxx " ;
		ls_sql+=" where dwbh='"+dwbh+"' and yhmc='"+sjs+"' and zwbm='04' and sfzszg in('Y','N')";
		ps2= conn.prepareStatement(ls_sql);
		rs2=ps2.executeQuery();
		if(rs2.next())
		{         
			count = rs2.getInt(1);			    
		}
		rs2.close();
		ps2.close();

		if (sjs.equals(""))
		{
			out.println("<BR>���ѣ��ͻ����<A HREF='/khxx/ViewCrm_khxx.jsp?khbh="+khbh+"' target='_blank'>["+khbh+"]</A>���ʦΪ��");
			sjs="δ֪";
		}
		else if (count>1)//���
		{
			conn.rollback();
			out.println("<BR>������["+dwbh+"]�꣬��ְ���ʦ<A HREF='/khxx/ViewCrm_khxx.jsp?khbh="+khbh+"' target='_blank'>["+sjs+"]</A>�ж��");
			return;
		}
		else if (count==1)//һ��
		{
			ls_sql=" select ygbh" ;
			ls_sql+=" from sq_yhxx " ;
			ls_sql+=" where dwbh='"+dwbh+"' and yhmc='"+sjs+"' and zwbm='04' and sfzszg in('Y','N')";
			ps2= conn.prepareStatement(ls_sql);
			rs2=ps2.executeQuery();
			if(rs2.next())
			{         
				bianhao = rs2.getString("ygbh");			    
			}
			rs2.close();
			ps2.close();
		}
		else{//����ְ���ʦ

			//2����鱾����ְ���ʦ
			ls_sql=" select count(*)" ;
			ls_sql+=" from sq_yhxx " ;
			ls_sql+=" where dwbh='"+dwbh+"' and yhmc='"+sjs+"' and zwbm='04' and sfzszg in('Y','N')";
			ps2= conn.prepareStatement(ls_sql);
			rs2=ps2.executeQuery();
			if(rs2.next())
			{         
				count = rs2.getInt(1);			    
			}
			rs2.close();
			ps2.close();

			if (count>1)//���
			{
				conn.rollback();
				out.println("<BR>������["+dwbh+"]�꣬��ְ���ʦ<A HREF='/khxx/ViewCrm_khxx.jsp?khbh="+khbh+"' target='_blank'>["+sjs+"]</A>�ж��");
				return;
			}
			else if (count==1)//һ��
			{
				ls_sql=" select ygbh" ;
				ls_sql+=" from sq_yhxx " ;
				ls_sql+=" where dwbh='"+dwbh+"' and yhmc='"+sjs+"' and zwbm='04' and sfzszg in('Y','N')";
				ps2= conn.prepareStatement(ls_sql);
				rs2=ps2.executeQuery();
				if(rs2.next())
				{         
					bianhao = rs2.getString("ygbh");			    
				}
				rs2.close();
				ps2.close();

				out.println("<BR>���ѣ���["+dwbh+"]�꣬���ʦ<A HREF='/khxx/ViewCrm_khxx.jsp?khbh="+khbh+"' target='_blank'>["+sjs+"]</A>����ְ");
			}
			else{//����ְ���ʦ

				//3����鹫˾������ְ���ʦ
				ls_sql=" select count(*)" ;
				ls_sql+=" from sq_yhxx " ;
				ls_sql+=" where ssfgs='"+fgsbh+"' and sq_yhxx.yhmc='"+sjs+"' and zwbm='04' and sq_yhxx.sfzszg in('Y','N')";
				ps2= conn.prepareStatement(ls_sql);
				rs2=ps2.executeQuery();
				if(rs2.next())
				{         
					count = rs2.getInt(1);			    
				}
				rs2.close();
				ps2.close();

				if (count>1)//���
				{
					conn.rollback();
					out.println("<BR>�������ʦ<A HREF='/khxx/ViewCrm_khxx.jsp?khbh="+khbh+"' target='_blank'>["+sjs+"]</A>�ж��");
					return;
				}
				if (count==1)//һ��
				{
					String lsdwbh=null;
					ls_sql=" select sq_yhxx.ygbh,dwmc" ;
					ls_sql+=" from sq_yhxx,sq_dwxx " ;
					ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_yhxx.ssfgs='"+fgsbh+"' and sq_yhxx.yhmc='"+sjs+"' and zwbm='04' and sq_yhxx.sfzszg in('Y','N')";
					ps2= conn.prepareStatement(ls_sql);
					rs2=ps2.executeQuery();
					if(rs2.next())
					{         
						bianhao = rs2.getString("ygbh");			    
						lsdwbh = rs2.getString("dwmc");			    
					}
					rs2.close();
					ps2.close();

					out.println("<BR>���ѣ����ʦ<A HREF='/khxx/ViewCrm_khxx.jsp?khbh="+khbh+"' target='_blank'>["+sjs+"]</A>���춯��["+lsdwbh+"]");
				}
				else{
//					conn.rollback();
					bianhao="δ֪";
					out.println("<BR>���ѣ��޴����ʦ<A HREF='/khxx/ViewCrm_khxx.jsp?khbh="+khbh+"' target='_blank'>["+sjs+"]</A>");
//					return;
				}
			}
		}



		if (sjs.equals("δ֪"))
		{
			bianhao="δ֪";
		}
		else{
			if (bianhao==null || bianhao.equals(""))
			{
				out.println("<BR>���ѣ����ʦ<A HREF='/khxx/ViewCrm_khxx.jsp?khbh="+khbh+"' target='_blank'>["+sjs+"]</A>���Ų�����");
				bianhao="δ֪";
			}
			else{
				ls_sql="update crm_khxx set sjsgh=? ";
				ls_sql+=" where  khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,bianhao);
				ps.executeUpdate();
				ps.close();
			}
		}


		
	}
	rs1.close();
	ps1.close();

	out.print("<P>�ɹ�");
}
catch (Exception e) {
	out.print("��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{

	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>
 
