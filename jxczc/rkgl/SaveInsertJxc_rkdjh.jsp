<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="jzgl" scope="page" class="jxc.kcjz.Kcjz"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");
String ls=null;
String rkph=null;
java.sql.Date rksj=null;
String gysmc=null;
String ckbh=null;
double rkzje=0;
String rklx=null;
String cgdh=null;
String lydh=null;
String dqbm=null;
String rkdzt="0";
String rkr=yhmc;
String shr=null;
String shjg=null;
String bz=null;
String rkcllx=null;
String fhsfwc=null;
rkcllx=cf.GB2Uni(request.getParameter("rkcllx"));
gysmc=cf.GB2Uni(request.getParameter("gysmc"));
ckbh=cf.GB2Uni(request.getParameter("ckbh"));
rklx=cf.GB2Uni(request.getParameter("rklx"));
cgdh=cf.GB2Uni(request.getParameter("cgdh"));
lydh=cf.GB2Uni(request.getParameter("lydh"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String nian=null;
String lsph=null;
double csph=0;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int num=0;
String scrq=cf.GB2Uni(request.getParameter("scrq"));
String scph=cf.GB2Uni(request.getParameter("scph"));

String jz=jzgl.cxkcjz(ckbh);
if (jz!=null && jz.equals("0"))//0:δ��ת��1���ѽ�ת
{
	out.print("�ϸ���û�н�ת�����ܽ��п�������");
	return;
}

try {
	conn=cf.getConnection();


	//���ֿ��Ƿ���Ȩ
	int cksq=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jxc_ckssfgs";
	ls_sql+=" where ssfgs in(select dwbh from sq_dwxx where dqbm='"+dqbm+"') and ckbh='"+ckbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		cksq=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (cksq==0)
	{
		out.println("���󣡸òֿ�δ�Դ˹�˾��Ȩ");
		return;
	}

	
	//��鹩Ӧ���Ƿ����
	if (!gysmc.equals("����"))
	{
		ls_sql=" select count(*) num ";
		ls_sql+=" from jxc_gysxx ";
		ls_sql+=" where dqbm='"+dqbm+"' and gysmc='"+gysmc+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			num=rs.getInt("num");
		}
		rs.close();
		ps.close();

		if (num<=0)
		{
			out.print("<font color=red>���󣺲����ڵĹ�����λ��["+gysmc+"]</font>");
			return;
		}
	}

	conn.setAutoCommit(false);

	//���ɱ��
	int count=0;
	ls_sql=" select NVL(max(substr(rkph,7,5)),0)+1 rkph,to_char(sysdate,'YYYY') nian ";
	ls_sql+=" from jxc_rkd ";
	ls_sql+=" where dqbm='"+dqbm+"' and to_char(substr(rkph,3,4))=to_char(sysdate,'YYYY') ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		lsph=cf.fillNull(rs.getString("rkph"));
		nian=cf.fillNull(rs.getString("nian"));
		rkph=dqbm+nian+cf.addZero(lsph,5);

		try
		{
			csph=Integer.parseInt(lsph);//����������Ϊ�����ʼ����1
		}
		catch(Exception e)
		{
			csph=1;//�������˵���������Ϊ�գ���ô�Ͱ�ckxh��ʼΪ1,��������û������ʱ������žͻ�Ϊ�գ�
			lsph = "1";		
			rkph=dqbm+nian+cf.addZero(lsph,5);
		}
	}
	rs.close();
	ps.close();

	//��鹩Ӧ�̶���״̬
	ls_sql=" select fhsfwc ";
	ls_sql+=" from jxc_gysdd ";
	ls_sql+=" where (gysddph='"+lydh+"') ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		fhsfwc=cf.fillNull(rs.getString("fhsfwc"));//�����Ƿ����
	}
	rs.close();
	ps.close();

	//	//���¶���״̬
	ls_sql="update jxc_gysdd set ddzt='6' ";//0���ȴ��µ���1�����µ���2���ѽ��ܣ�3���ѷ�����4������⣻5������ɷ�����6�����ڰ�����⣻ 9���ѽ���
	ls_sql+=" where  (gysddph='"+lydh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jxc_rkd ( rkph,rksj,gysmc,ckbh,rkzje,zcpzje,ccpzje,thclzje,bfclzje,rklx,cgdh,lydh,dqbm,rkdzt,rkr,shr,shjg,bz,rkrssbm,rkrssfgs,rkcllx,sfxyzbsh,wldszje ) ";
	ls_sql+=" values ( ?,SYSDATE,?,?,?,0,0,0,0,?,?,?,?,?,?,?,?,?,?,?,?,'N',0 ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,rkph);
	ps.setString(2,gysmc);
	ps.setString(3,ckbh);
	ps.setDouble(4,rkzje);
	ps.setString(5,rklx);
	ps.setString(6,cgdh);
	ps.setString(7,lydh);
	ps.setString(8,dqbm);
	ps.setString(9,rkdzt);
	ps.setString(10,rkr);
	ps.setString(11,shr);
	ps.setString(12,shjg);
	ps.setString(13,bz);
	ps.setString(14,lrbm);
	ps.setString(15,ssfgs);
	ps.setString(16,rkcllx);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.location.href="xzgysfhph.jsp?rkph=<%=rkph%>&scrq=<%=scrq%>&scph=<%=scph%>";
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