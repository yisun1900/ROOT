<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
java.sql.Date xgsj=null;
String xgr=null;
String zt=null;
String hth=null;
String khxm=null;
String xglx=null;
java.sql.Date yjzrq=null;
double ywdzgce=0;
double yqye=0;
java.sql.Date xjzrq=null;
double xwdzgce=0;
double xqye=0;
khbh=cf.GB2Uni(request.getParameter("khbh"));
ls=request.getParameter("xgsj");
try{
	if (!(ls.equals("")))  xgsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xgsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�޸�ʱ��]����ת����������:"+e);
	return;
}
xgr=cf.GB2Uni(request.getParameter("xgr"));
zt=cf.GB2Uni(request.getParameter("zt"));
hth=cf.GB2Uni(request.getParameter("hth"));
khxm=cf.GB2Uni(request.getParameter("khxm"));
xglx=cf.GB2Uni(request.getParameter("xglx"));
ls=request.getParameter("yjzrq");
try{
	if (!(ls.equals("")))  yjzrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yjzrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[ԭҵ����תʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("ywdzgce");
try{
	if (!(ls.equals("")))  ywdzgce=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ywdzgce������");
	return;
}
catch (Exception e){
	out.println("<BR>[ԭ��ͬԭ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("yqye");
try{
	if (!(ls.equals("")))  yqye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yqye������");
	return;
}
catch (Exception e){
	out.println("<BR>[ԭ����ǩԼ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("xjzrq");
try{
	if (!(ls.equals("")))  xjzrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xjzrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[�޸ĺ�ҵ����תʱ��]����ת����������:"+e);
	return;
}

//����Ƿ������һ��
if (!ls.equals(""))
{
	String nian=ls.substring(0,4);
	String yue=ls.substring(5,7);
	String lday=cf.lastDay(nian,yue);
	if (!lday.equals(ls))
	{
		out.println("<BR>����[�޸ĺ�ҵ����תʱ��]�ǵ������һ�졺"+lday+"��");
		return;
	}

	if (ls.compareTo(cf.today())>0)
	{
		out.println("ʧ�ܣ�[�޸ĺ�ҵ����תʱ��]���ܴ���[����"+cf.today()+"]!");
		return;
	}
}




ls=request.getParameter("xwdzgce");
try{
	if (!(ls.equals("")))  xwdzgce=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xwdzgce������");
	return;
}
catch (Exception e){
	out.println("<BR>[�޸ĺ��ͬԭ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("xqye");
try{
	if (!(ls.equals("")))  xqye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xqye������");
	return;
}
catch (Exception e){
	out.println("<BR>[�޸ĺ󹤳�ǩԼ��]����ת����������:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String mqyjjzsj=null;
	String mqtdyjjzsj=null;
	String mqzt=null;
	ls_sql="select yjjzsj,tdyjjzsj,zt";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mqyjjzsj=cf.fillNull(rs.getDate("yjjzsj"));
		mqtdyjjzsj=cf.fillNull(rs.getDate("tdyjjzsj"));
		mqzt=cf.fillNull(rs.getString("zt"));
	}
	rs.close();
	ps.close();
	if (!mqzt.equals(zt))
	{
		out.println("���󣡿ͻ�״̬�Ѹı䣬�������˵�");
		return;
	}

	if (zt.equals("3"))//3���˵��ͻ�
	{
		if (!mqtdyjjzsj.equals("") && xglx.equals("3"))//1���޸ģ�2��ɾ����3������
		{
			out.println("�����ѽ�ת�����������ӣ���תʱ��Ϊ��"+mqtdyjjzsj);
			return;
		}

		if (xjzrq!=null)
		{
			if (mqyjjzsj.compareTo(xjzrq.toString())>=0)
			{
				out.println("���󣡡�ǩ��ҵ����תʱ�䡻ҪС�ڡ��˵�ҵ����תʱ�䡻");
				return;
			}
		}
	}
	else{
		if (!mqyjjzsj.equals("") && xglx.equals("3"))//1���޸ģ�2��ɾ����3������
		{
			out.println("�����ѽ�ת�����������ӣ���תʱ��Ϊ��"+mqyjjzsj);
			return;
		}
	}
	
	String getzt=null;
	if (yjzrq!=null)
	{
		ls_sql="select zt";
		ls_sql+="  from cw_qmjzmx";  
		ls_sql+=" where khbh='"+khbh+"' and jzrq=?";
		ps=conn.prepareStatement(ls_sql);  
		ps.setDate(1,yjzrq);
		rs=ps.executeQuery();
		if (rs.next())
		{
			getzt=rs.getString(1);
		} 
		rs.close();
		ps.close();

		if (!getzt.equals(zt))
		{
			if (xglx.equals("1") || xglx.equals("2"))//1���޸ģ�2��ɾ����3������
			{
				out.println("���󣡿ͻ�״̬�Ѹı䣬�����١��޸ġ���ɾ����");
				return;
			}
		}
	}
	
	if (yjzrq!=null)
	{
		int count=0;
		ls_sql="select count(*)";
		ls_sql+="  from cw_qmjz";  
		ls_sql+="  where jzrq=?";  
		ps=conn.prepareStatement(ls_sql);  
		ps.setDate(1,yjzrq);
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		} 
		rs.close();
		ps.close();
		if (count<1)
		{
			out.println("���󣡲��޽�ת��¼��"+yjzrq+"��");
			return;
		}
	}

	if (xjzrq!=null)
	{
		int count=0;
		ls_sql="select count(*)";
		ls_sql+="  from cw_qmjz";  
		ls_sql+="  where jzrq=?";  
		ps=conn.prepareStatement(ls_sql);  
		ps.setDate(1,xjzrq);
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		} 
		rs.close();
		ps.close();
		if (count<1)
		{
			out.println("���󣡲��޽�ת��¼��"+xjzrq+"��");
			return;
		}
	}

	conn.setAutoCommit(false);

	ls_sql="insert into cw_jzyjxgjl ( khbh,xgsj,xgr,zt,hth,khxm,xglx,yjzrq,ywdzgce,yqye,xjzrq,xwdzgce,xqye ) ";
	ls_sql+=" values ( ?,SYSDATE,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,xgr);
	ps.setString(3,zt);
	ps.setString(4,hth);
	ps.setString(5,khxm);
	ps.setString(6,xglx);
	ps.setDate(7,yjzrq);
	ps.setDouble(8,ywdzgce);
	ps.setDouble(9,yqye);
	ps.setDate(10,xjzrq);
	ps.setDouble(11,xwdzgce);
	ps.setDouble(12,xqye);
	ps.executeUpdate();
	ps.close();

	if (xglx.equals("1") || xglx.equals("2"))//1���޸ģ�2��ɾ����3������
	{
		//ɾ���ɽ�ת��¼
		if (yjzrq!=null)
		{
			ls_sql="delete from cw_qmjzmx ";
			ls_sql+=" where khbh='"+khbh+"' and jzrq=?";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,yjzrq);
			ps.executeUpdate();
			ps.close();


			if (getzt.equals("3"))//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ�
			{
				ls_sql=" update crm_khxx";
				ls_sql+=" set tdyjjzsj=null";
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
			else{
				ls_sql=" update crm_khxx";
				ls_sql+=" set yjjzsj=null";
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}

			ls_sql="update cw_qmjz set khzs=(select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' and cw_qmjzmx.jzrq=?)";
			ls_sql+=" ,qyze=(select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' and cw_qmjzmx.jzrq=?)";
			ls_sql+=" ,tdkhzs=(select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' and cw_qmjzmx.jzrq=?)";
			ls_sql+=" ,tdqyze=(select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' and cw_qmjzmx.jzrq=?)";
			ls_sql+=" where jzrq=?";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,yjzrq);
			ps.setDate(2,yjzrq);
			ps.setDate(3,yjzrq);
			ps.setDate(4,yjzrq);
			ps.setDate(5,yjzrq);
			ps.executeUpdate();
			ps.close();
		}
	}

	//�����½�ת��¼
	if (xjzrq!=null)
	{
		if (zt.equals("3"))//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ�
		{
			ls_sql="insert into cw_qmjzmx (jzrq,khbh,zt,khxm,hth,sjs,wdzgce,qye,suijin,suijinbfb,sjf,glf,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,kglf,kqtk,zkl,cxhdbm,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh)";
			ls_sql+=" select ?,khbh,zt,khxm,hth,sjs,wdzgce,qye,suijin,suijinbfb,sjf,glf,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,kglf,kqtk,zkl,cxhdbm,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,xjzrq);
			ps.executeUpdate();
			ps.close();

			ls_sql=" update crm_khxx";
			ls_sql+=" set tdyjjzsj=?";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,xjzrq);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="insert into cw_qmjzmx (jzrq,khbh,zt,khxm,hth,sjs,wdzgce,qye,suijin,suijinbfb,sjf,glf,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,kglf,kqtk,zkl,cxhdbm,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh)";
			ls_sql+=" select ?,khbh,zt,khxm,hth,sjs,wdzgce,qye,suijin,suijinbfb,sjf,glf,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,kglf,kqtk,zkl,cxhdbm,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,xjzrq);
			ps.executeUpdate();
			ps.close();

			ls_sql=" update crm_khxx";
			ls_sql+=" set yjjzsj=?";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,xjzrq);
			ps.executeUpdate();
			ps.close();
		}

		ls_sql="update cw_qmjz set khzs=(select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' and cw_qmjzmx.jzrq=?)";
		ls_sql+=" ,qyze=(select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' and cw_qmjzmx.jzrq=?)";
		ls_sql+=" ,tdkhzs=(select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' and cw_qmjzmx.jzrq=?)";
		ls_sql+=" ,tdqyze=(select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' and cw_qmjzmx.jzrq=?)";
		ls_sql+=" where jzrq=?";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,xjzrq);
		ps.setDate(2,xjzrq);
		ps.setDate(3,xjzrq);
		ps.setDate(4,xjzrq);
		ps.setDate(5,xjzrq);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>����ʧ��,��������: " + e);
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