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
String[] clbmjh =request.getParameterValues("clbm");
String[] drhwjh =request.getParameterValues("drhw");
String[] zljbjh =request.getParameterValues("zljb");
String[] kcsljh =request.getParameterValues("kcsl");
String[] drsljh =request.getParameterValues("drsl");
String[] dchjbhjh =request.getParameterValues("dchjbh");
String[] dchwbhjh =request.getParameterValues("dchwbh");
String dchjbh=null;
String dchwbh=null;
String clbm=null;
String drhw=null;
String zljb=null;
String drhjbh=null;
long dtzph=0;
double mmt=0;
double xykcsl=0;
double cum=0;
double kcsl=0;
double drsl=0;
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
			ls_sql+=" from jxc_hjtzmx ";
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
		dchjbh=dchjbhjh[i];
		if (dchjbh==null || dchjbh.equals(""))
		{out.println("��"+clbm+"���������ܲ���Ϊ�գ�");
			conn.rollback();return;}
		
		//������λ
		dchwbh=dchwbhjh[i];
		if (dchwbh==null || dchwbh.equals(""))
		{out.println("��"+clbm+"��������λ����Ϊ�գ�");
			conn.rollback();return;}
		
		//�����λ
		drhw=drhwjh[i];
		if (drhw==null || drhw.equals(""))
		{out.println("��"+clbm+"�������λ����Ϊ�գ�");
			conn.rollback();return;}
		
		//��������
		zljb=zljbjh[i];
		if (zljb==null || zljb.equals(""))
		{out.println("��"+clbm+"������������Ϊ�գ�");
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
		ls=drsljh[i];
		try{
			if (!(ls.equals("")))  drsl=Double.parseDouble(ls.trim());
		}
		catch (java.lang.NullPointerException nulle){
			out.println("<BR>����drsljh[i]������");
			conn.rollback();return;
		}
		catch (Exception e){
			out.println("<BR>[��������]����ת����������:"+e);
			conn.rollback();return;
		}
		if (drsl<=0)
		{
			out.println("��"+clbm+"������������������㣡");
			conn.rollback();return;
		}
		if (drsl>kcsl)
		{
			out.println("��"+clbm+"�������������ܴ��ڿ��������");
			conn.rollback();return;
		}
		
if (!(drhw.equals("0")) && drsl>0)//�Զ����� ���³�����ϸ
		{
			//��ѯ���ܱ���
			ls_sql=" select hjbh";
			ls_sql+=" from jxc_hwmc ";
			ls_sql+=" where hwbh='"+drhw+"'";
			ps= conn.prepareStatement(ls_sql);
			rs=ps.executeQuery();
			if (rs.next())
			{
				drhjbh=cf.fillNull(rs.getString("hjbh"));
			}
			else
			{out.print("���󣡣��������ڵĻ��ܱ���["+drhw+"]");conn.rollback();return;}
			rs.close();
			ps.close();

			cct++;
			ls_sql=" select tzsl";
			ls_sql+=" from jxc_hjtzmx ";
			ls_sql+=" where tzph='"+tzph+"' and clbm='"+clbm+"' and drhw='"+drhw+"' and zljb='"+zljb+"' ";
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

			ls_sql="insert into jxc_hjtzmx ( tzph,tzxh,clbm,zljb,tzsl,dchj,dchw,drhj,drhw ) ";
			ls_sql+=" values ( ?,?,?,?,?,?,?,?,? ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,dtzph);
			ps.setDouble(2,tty);
			ps.setString(3,clbm);
			ps.setString(4,zljb);
			ps.setDouble(5,drsl);
			ps.setString(6,dchjbh);
			ps.setString(7,dchwbh);
			ps.setString(8,drhjbh);
			ps.setString(9,drhw);
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
			//������д����
			cum=drsl;
			ls_sql = " select kcsl,lsh";
			ls_sql+= " from jxc_kcb";
			ls_sql +=" where jxc_kcb.clbm='"+clbm+"' and jxc_kcb.hwbh='"+dchwbh+"' and zljb='"+zljb+"'  ";
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
						ls_sql=" insert into jxc_kcb(lsh,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz,clbm,zljb,clzk,rkph,ckph,scph,scrq,hwbh,hjbh,ckbh,dqbm,rkj,kcsl,kcje,jqpjcbj) ";
						ls_sql+=" select '"+lsh+"',clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz,clbm,zljb,clzk,rkph,ckph,scph,scrq,'"+drhw+"','"+drhjbh+"',ckbh,dqbm,rkj,'"+cum+"',rkj*"+cum+",jqpjcbj ";
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
							out.print("���¿��ɹ���<br>");
						}
						if (ps != null) ps.close();
						cum=0;
					}
					else//ִ�в��� ������
					{
						cum=cum-xykcsl;
						//���¿������
						ls_sql=" update jxc_kcb set hjbh='"+drhjbh+"',hwbh='"+drhw+"' ";
						ls_sql+=" where  lsh='"+ylsh+"' ";
						ps= conn.prepareStatement(ls_sql);
						if (ps.executeUpdate()!=1)
						{
							out.println("<BR>����ʧ�ܣ�1");
							conn.rollback();return;
						}
						else
						{
							out.print("���¿��ɹ���<br>");
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

