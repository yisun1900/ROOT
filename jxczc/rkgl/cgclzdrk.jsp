<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<jsp:useBean id="jqpj" scope="page" class="jxc.jqpj.Jqpj"/>
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
int coun=0;
String lsh=null;
String clbm=null;
String rkph=null;
String dqbm=null;
String ckbh=null;
String hjbh=null;
String hwbh=null;
String scph=null;
String zljb=null;
String gysmc=null;
java.sql.Date scrq2=null;
String scrq=null;
double sumkcje=0;
double sumkcsl=0;
double sumjqpjcbj=0;
double jqpjcbj=0;
double ccpzkl=0;
double rkj=0;
double rksl=0;
int maxlsh=0;
int lslsh=0;
String[] clbmjh =request.getParameterValues("clbm");//���ϱ���
String[] ccpzkljh =request.getParameterValues("ccpzkl");//�д�Ʒ�ۿ���
String[] zljbjh =request.getParameterValues("zljb");//��������
String[] rksljh =request.getParameterValues("rksl");//�������
String[] rkjjh =request.getParameterValues("rkj");//����λ
String[] hwbhjh =request.getParameterValues("hwbh");//����λ
String[] hjbhjh =request.getParameterValues("hjbh");//������
String[] scrqjh =request.getParameterValues("scrq");//��������
String[] scphjh =request.getParameterValues("scph");//��������
ckbh=cf.GB2Uni(request.getParameter("ckbh"));
rkph=cf.GB2Uni(request.getParameter("rkph"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	//��������Ƿ��Ѿ����
	ls_sql=" select clbm";
	ls_sql+=" from jxc_kcb ";
	ls_sql+=" where  rkph='"+rkph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		conn.rollback();
		out.print("���ʧ�ܣ�������ţ���"+rkph+"���Ѿ���⣡");
		return;
	}
	rs.close();
	ps.close();

	//��ѯ������λ
	ls_sql=" select gysmc";
	ls_sql+=" from jxc_rkd ";
	ls_sql+=" where  rkph='"+rkph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		gysmc=cf.fillNull(rs.getString("gysmc"));
	}
	rs.close();
	ps.close();

	//����������ˮ��
	ls_sql=" select NVL(max(TO_NUMBER(lsh)),0) lsh";
	ls_sql+=" from jxc_kcb ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())//����л� ֱ�Ӹ�������
	{
		maxlsh=rs.getInt("lsh");
	}
	rs.close();
	ps.close();

	//��������Ƿ��л� 
	for (int i=0;i<clbmjh.length;i++)
	{
		coun++;

		//���������ϼ۸�����Ƿ��д˲���
		ls_sql=" select clbm";
		ls_sql+=" from jxc_cljgb ";
		ls_sql+=" where  clbm='"+clbmjh[i]+"' and dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())//�����ϱ���
		{
			clbm=clbmjh[i];
		}
		else
		{
			conn.rollback();
			out.print("���ʧ�ܣ��������ϼ۸�����ڱ��롾"+clbmjh[i]+"����");
			return;
		}
		rs.close();
		ps.close();

		
		hwbh=hwbhjh[i];//����λ
		if (hwbh==null || hwbh.equals(""))
		{
			conn.rollback();
			out.print("���ʧ�ܣ���š�"+coun+"��������λ����Ϊ�գ�");
			return;
		}

		hjbh=hjbhjh[i];//������
		if (hjbh==null || hjbh.equals(""))
		{
			conn.rollback();
			out.print("���ʧ�ܣ���š�"+coun+"���������ܲ���Ϊ�գ�");
			return;
		}

		//��������
		zljb=zljbjh[i];
		if (zljb==null || zljb.equals(""))
		{
			conn.rollback();
			out.print("���ʧ�ܣ���š�"+coun+"��������������Ϊ�գ�");
			return;
		}

		//��������
		scph=cf.GB2Uni(scphjh[i]);
		if (scph==null || scph.equals(""))
		{
			conn.rollback();
			out.print("���ʧ�ܣ���š�"+coun+"�����������Ų���Ϊ�գ�");
			return;
		}

		//��������
		scrq=scrqjh[i];
		ls=scrqjh[i];
		try{
			if (!(ls.equals("")))  
			{
				scrq2=java.sql.Date.valueOf(ls.trim());
			}
			else
			{
				conn.rollback();
				out.print("���ʧ�ܣ���š�"+coun+"�����������ڲ���Ϊ�գ�");
				return;
			}
		}
		catch (java.lang.NullPointerException nulle){
			conn.rollback();
			out.println("<BR>����scrq������");
			return;
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[��������]����ת����������:"+e);
			return;
		}

		//�������
		ls=rksljh[i];
		try{
			if (!(ls.equals("")))  {
				rksl=Double.parseDouble(ls.trim());
			}
			else
			{
				conn.rollback();
				out.print("<font clolr='red'>�ڡ�"+coun+"���С�"+clbm+"�������������Ϊ�գ�</font><br>");
				return;
			}
		}
		catch (java.lang.NullPointerException nulle){
			conn.rollback();
			out.println("<BR>����rksl������");
			return;
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[�������]����ת����������:"+e);
			return;
		}

		//����ת��
		ls=rkjjh[i];
		try{
			if (!(ls.equals(""))) 
			{ 
				rkj=Double.parseDouble(ls.trim());
			}
			else
			{
				conn.rollback();
				out.print("<font clolr='red'>�ڡ�"+coun+"���С�"+clbm+"�����۸���Ϊ�գ�</font><br>");
				return;
			}
		}
		catch (java.lang.NullPointerException nulle){
			conn.rollback();
			out.println("<BR>����rkj������");
			return;
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[����]����ת����������:"+e);
			return;
		}

		//���д�Ʒ�ۿ���
		ls=ccpzkljh[i];
		try{
			if (!(ls.equals(""))) 
			{ 
				ccpzkl=Double.parseDouble(ls.trim());
			}
			else
			{
				if (zljb.equals("2"))
				{
					conn.rollback();
					out.print("������š�"+coun+"���д�Ʒ������Ϊ�㣬����¼��д�Ʒ�ۿ��ʣ�");
					return;
				}
				else//���û�вд�Ʒ�ۿ���Ϊ1 ��û���ۿ�
				{
					ccpzkl=1;
				}
			}
		}
		catch (java.lang.NullPointerException nulle){
			conn.rollback();
			out.println("<BR>����ccpzkl������");
			return;
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[�д�Ʒ�ۿ���]����ת����������:"+e);
			return;
		}

		//���д�Ʒ�ۿ���¼���Ƿ�Ϸ�
		if(ccpzkl>1 || ccpzkl<=0)
		{
			conn.rollback();
			out.print("������š�"+coun+"���д�Ʒ�ۿ���Ӧ��Ϊ0-1֮�䣡");
			return;
		}
//���¿��
		lslsh=maxlsh+coun;
		lsh=cf.addZero(lslsh,13);

		//�������в����ڵ�����д��
		ls_sql=" insert into jxc_kcb(lsh,clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,gysmc,cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz ";
		ls_sql+=" ,clbm,zljb,clzk,rkph,scph,scrq ";
		ls_sql+=" ,hwbh,hjbh,ckbh,dqbm,rkj,kcsl,kcje,jqpjcbj) ";
		ls_sql+=" select '"+lsh+"',clmc,cllb,cldlbm,clxlbm,scsmc,ppmc,'"+gysmc+"',cllbbm,xh,nbbm,gg,clysbm,djzl,jldwbm,sfbhpj,pjts,cpjb,fgsx,cpsm,cd,zp,cgzq,bzq,bztxq,bz ";
		ls_sql+=" ,jxc_rkmx.clbm,'"+zljb+"','"+ccpzkl+"','"+rkph+"','"+scph+"',to_date('"+scrq+"','YYYY-MM-DD')";
		ls_sql+=" ,'"+hwbh+"','"+hjbh+"','"+ckbh+"','"+dqbm+"','"+rkj+"','"+rksl+"','"+rkj*rksl+"','0' jqpjcbj ";
		ls_sql+=" from jxc_rkmx,jxc_clbm ";
		ls_sql+=" where jxc_rkmx.clbm=jxc_clbm.clbm and jxc_rkmx.clbm='"+clbm+"' and jxc_rkmx.rkph='"+rkph+"'";
		ls_sql+=" and jxc_rkmx.scph='"+scph+"' and to_char(jxc_rkmx.scrq,'YYYY-MM-DD')='"+scrq+"'  ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		if (zljb.equals("1"))//1������Ʒ��2���д�Ʒ��3������Ʒ��
		{
			//����Ʒ������,�Ѳɹ�����
			ls_sql="update jxc_cljgb set zcpzsl=zcpzsl+"+rksl+",ycgsl=ycgsl-"+rksl+" ";
			ls_sql+=" where  clbm='"+clbm+"' and dqbm='"+dqbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (zljb.equals("2"))//1������Ʒ��2���д�Ʒ��3������Ʒ��
		{
			//�д�Ʒ������,�Ѳɹ�����
			ls_sql="update jxc_cljgb set ccpzsl=ccpzsl+"+rksl+",ycgsl=ycgsl-"+rksl+" ";
			ls_sql+=" where  (clbm='"+clbm+"' and dqbm='"+dqbm+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (zljb.equals("3"))//1������Ʒ��2���д�Ʒ��3������Ʒ��
		{
			//����Ʒ������,�Ѳɹ�����
			ls_sql="update jxc_cljgb set bfpzsl=bfpzsl+"+rksl+",ycgsl=ycgsl-"+rksl+" ";
			ls_sql+=" where  (clbm='"+clbm+"' and dqbm='"+dqbm+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		
	}

	//������ⵥ״̬,0��δ�ύ��1���ȴ���ˣ�2���ȴ���⣻3������⣻4���ѽ��㣻6���ȴ��ܲ����
	ls_sql="update jxc_rkd set rkdzt='3' ";
	ls_sql+=" where  (rkph='"+rkph+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	//��Ȩƽ���ɱ���
	out.print(jqpj.jqpjcbj(dqbm));

	%>
	<SCRIPT language=javascript >
	<!--
		alert("����ɹ�");
		window.close();
	//-->
	</SCRIPT>
	<center><DIV><font color="blue">���������ɣ�����</font></DIV></center>
	<center><DIV><a href="/jxcdy/printzcrkd.jsp?rkph=<%=rkph%>" target="_back">��ӡ��ⵥ</a></DIV></center>
	<%
	
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>