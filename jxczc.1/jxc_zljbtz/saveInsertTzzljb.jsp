<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ylsh=null;
String lsh=null;
String ls=null;
String tzph = request.getParameter("tzph");
String ckbh = request.getParameter("ckbh");
String dqbm = request.getParameter("dqbm");
String[] clbmjh =request.getParameterValues("clbm");
String[] yzljbjh =request.getParameterValues("yzljb");
String[] xzljbjh =request.getParameterValues("xzljb");
String[] kcsljh =request.getParameterValues("kcsl");
String[] tzsljh =request.getParameterValues("tzsl");
String[] scphjh =request.getParameterValues("scph");
String clbm=null;
String xzljb=null;
String yzljb=null;
String scph=null;
long dtzph=0;
double mmt=0;
double xykcsl=0;
double cum=0;
double kcsl=0;
double tzsl=0;
int maxxh=0;
int nu=0;
int cct=0;
int tty=0;
String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps2=null;
ResultSet rs2 = null;

try {
	conn=cf.getConnection();    //�õ�����
	conn.setAutoCommit(false);
	try{
			if (!(tzph.equals("")))  dtzph=Long.parseLong(tzph.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>����tzph������");
			conn.rollback();return;
		}
		catch (Exception e){
			out.println("<BR>[��������]����ת����������:"+e);
			conn.rollback();return;
		}
	//��ѯ������
			ls_sql=" select MAX(tzxh) xh";
			ls_sql+=" from jxc_zltzmx ";
			ls_sql+=" where tzph='"+tzph+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			if (rs.next())
			{
				maxxh=rs.getInt("xh");
				
			}
			rs.close();
			ps.close();

	for (int i=0;i<clbmjh.length ;i++ )
	{
		nu++;
		clbm=clbmjh[i];
		if (clbm==null || clbm.equals(""))
		{out.println("��š�"+nu+"�����ϱ��벻��Ϊ�գ�");
			conn.rollback();return;}
		//��������
		scph=scphjh[i];
		if (scph==null || scph.equals(""))
		{out.println("��"+clbm+"���������Ų���Ϊ�գ�");
		conn.rollback();return;}
		//ԭ��������
		yzljb=yzljbjh[i];
		if (yzljb==null || yzljb.equals(""))
		{out.println("��"+clbm+"��ԭ����������Ϊ�գ�");
		conn.rollback();return;}
		//����������
		xzljb=xzljbjh[i];
		if (xzljb==null || xzljb.equals(""))
		{out.println("��"+clbm+"��������������Ϊ�գ�");
		conn.rollback();return;}
		//�������
		ls=kcsljh[i];
		try{
			if (!(ls.equals("")))  kcsl=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>����kcsljh[i]������");
			conn.rollback();return;
		}
		catch (Exception e){
			out.println("<BR>[�������]����ת����������:"+e);
			conn.rollback();return;
		}
		//��������
		ls=tzsljh[i];
		try{
			if (!(ls.equals("")))  tzsl=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>����tzsljh[i]������");
			conn.rollback();return;
		}
		catch (Exception e){
			out.println("<BR>[��������]����ת����������:"+e);
			conn.rollback();return;
		}
		if (tzsl<=0)
		{
			out.println("��"+clbm+"������������������㣡");
			conn.rollback();return;
		}
		if (tzsl>kcsl)
		{
			out.println("��"+clbm+"�������������ܴ��ڿ��������");
			conn.rollback();return;
		}
		
if (!(xzljb.equals("0")) && tzsl>0)//����ı��˵��������ͼ��� ����¿��
		{

			cct++;
			ls_sql=" select tzsl";
			ls_sql+=" from jxc_zltzmx ";
			ls_sql+=" where tzph='"+tzph+"' and clbm='"+clbm+"' and xzljb='"+xzljb+"' and yzljb='"+yzljb+"' and scph='"+scph+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			if (rs.next())
			{
				mmt=rs.getDouble("tzsl");
				if (mmt>0)
				{
					out.print("<font clolr=\"red\">���󣺵ڡ�"+nu+"���С�"+clbm+"���ظ����̣�</font><br>");
					conn.rollback();return;
				}
			}
			rs.close();
			ps.close();
			
//			if (maxxh==0){maxxh=1;}
			tty=maxxh+cct;

			ls_sql="insert into jxc_zltzmx ( tzph,tzxh,clbm,scph,yzljb,xzljb,tzsl ) ";
			ls_sql+=" values ( ?,?,?,?,?,?,? ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,dtzph);
			ps.setDouble(2,tty);
			ps.setString(3,clbm);
			ps.setString(4,scph);
			ps.setString(5,yzljb);
			ps.setString(6,xzljb);
			ps.setDouble(7,tzsl);

			if (ps.executeUpdate()!=1)
			{
				out.println("<BR>����ʧ�ܣ�");
				conn.rollback();return;
			}
			else
			{
				out.print("��"+clbm+"�����³ɹ���<br>");
			}
			if (ps != null) ps.close();
			//������д�˻���
			cum=tzsl;
			ls_sql = " select kcsl,lsh";
			ls_sql+= " from jxc_kcb";
			ls_sql +=" where jxc_kcb.clbm='"+clbm+"' and ckbh='"+ckbh+"' and jxc_kcb.scph='"+scph+"' and zljb='"+yzljb+"' ";
			ls_sql +=" order by scrq ";
			ps2= conn.prepareStatement(ls_sql);
			rs2=ps2.executeQuery();
			while(rs2.next())
			{//7737
				ylsh=cf.fillNull(rs2.getString("lsh"));
				xykcsl=rs2.getDouble("kcsl");
				if (cum>0)
				{//7739
					//����������ˮ��
						ls_sql=" select lpad(NVL(max(lsh),0)+1,13,0) lsh";
						ls_sql+=" from jxc_kcb ";
						ps= conn.prepareStatement(ls_sql);
						rs=ps.executeQuery();
						if (rs.next())
						{
							lsh=rs.getString("lsh");
						}
						rs.close();
						ps.close();
					if (cum<=xykcsl)//ִ�в������ ������
					{
						//������������д�������
						ls_sql=" insert into jxc_kcb(lsh,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz,clbm,zljb,clzk,rkph,ckph,scph,scrq,hwbh,hjbh,ckbh,dqbm,rkj,kcsl,kcje) ";
						ls_sql+=" select '"+lsh+"',clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz,clbm,'"+xzljb+"',clzk,rkph,ckph,scph,scrq,hwbh,hjbh,ckbh,dqbm,rkj,'"+cum+"',rkj*"+cum+" ";
						ls_sql+=" from jxc_kcb ";
						ls_sql+=" where lsh='"+ylsh+"' ";
						ps= conn.prepareStatement(ls_sql);
						if (ps.executeUpdate()!=1)
						{
							out.println("<BR>����ʧ�ܣ�1");
							conn.rollback();return;
						}
						else
						{
							out.print("��"+clbm+"�����¿��ɹ���<br>");
						}
						if (ps != null) ps.close();
						//���¿������
						ls_sql=" update jxc_kcb set kcsl=kcsl-"+cum+",kcje=(kcsl-"+cum+")*rkj ";
						ls_sql+=" where  lsh='"+ylsh+"' ";
						ps= conn.prepareStatement(ls_sql);
						if (ps.executeUpdate()!=1)
						{
							out.println("<BR>����ʧ�ܣ�1");
							conn.rollback();return;
						}
						else
						{
							out.print("���¿��ɹ���2<br>");
						}
						if (ps != null) ps.close();
						cum=0;
					}
					else//ִ�в��� ������
					{
						cum=cum-xykcsl;
						//���¿������
						ls_sql=" update jxc_kcb set zljb='"+xzljb+"' ";
						ls_sql+=" where  lsh='"+ylsh+"' ";
						ps= conn.prepareStatement(ls_sql);
						if (ps.executeUpdate()!=1)
						{
							out.println("<BR>����ʧ�ܣ�1");
							conn.rollback();return;
						}
						else
						{
							out.print("���¿��ɹ���3<br>");
						}
						if (ps != null) ps.close();
					}
				}//7739
			}//7737
			rs2.close();
			ps2.close();
			if (cum>0)//���ȫ��ѭ���� ���ֵ�������� ��ô˵����������>��� 
			{
				out.print("���󣡿���������㣡����");
				conn.rollback();return;
			}
			//�޸Ĳ��ϼ۸������Ʒ������
			ls_sql=" update jxc_cljgb set zcpzsl=(select NVL(sum(kcsl),0) from jxc_kcb where clbm='"+clbm+"' and zljb='1' and dqbm='"+dqbm+"'),ccpzsl=(select NVL(sum(kcsl),0) from jxc_kcb where clbm='"+clbm+"' and zljb='2' and dqbm='"+dqbm+"'),bfpzsl=(select NVL(sum(kcsl),0) from jxc_kcb where clbm='"+clbm+"' and zljb='3' and dqbm='"+dqbm+"') ";
			ls_sql+=" where clbm='"+clbm+"' and dqbm='"+dqbm+"' ";
			ps2= conn.prepareStatement(ls_sql);
			ps2.executeUpdate();
			ps2.close();
			//�����������Ϊ��ļ�¼�����
			ls_sql="delete from jxc_kcb ";
			ls_sql+=" where kcsl=0 ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}
	conn.commit();
	%>
	<SCRIPT language=javascript >
	<!--
		alert("����ɹ�");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>ls_sql=" + ls_sql );
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){}
 }
%>              

