<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
String lrbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");
String lrr=(String)session.getAttribute("yhmc");
if (lrr==null)
{
	lrr="δ֪";
}
if (lrbm==null)
{
	lrbm="99999";
}
if (ssfgs==null)
{
	ssfgs="99999";
}

String inTelNum=request.getParameter("inTelNum");
String bjhm=request.getParameter("bjhm");
String lywjml=request.getParameter("lywjml");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String khbh="";
	ls_sql="select khbh";
	ls_sql+=" from  crm_khlxfs";
	ls_sql+=" where dhhm='"+inTelNum+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh").trim();
	}
	rs.close();
	ps.close();

	long xh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  call_ldjl";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	xh++;


	ls_sql="insert into call_ldjl (xh,ldsj,ldhm,ldlxbm,khbh,khlx,bjhm,lywjml,lywj,jtzt,lrr,lrsj,lrbm,ssfgs) ";
	ls_sql+=" values(?,SYSDATE,?,?,?,?,?,?,?,?,?,SYSDATE,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xh);
	ps.setString(2,inTelNum);
	ps.setString(3,"01");
	ps.setString(4,khbh);
	ps.setString(5,"3");//1����ѯ��2��ǩ����3��δ֪
	ps.setString(6,bjhm);
	ps.setString(7,lywjml);
	ps.setString(8,"");
	ps.setString(9,"1");//1��δ��ͨ��2����ͨ
	ps.setString(10,lrr);
	ps.setString(11,lrbm);
	ps.setString(12,ssfgs);
	ps.executeUpdate();
	ps.close();

	String getStr2="";

	String	khxm=null;
	String	xb=null;
	String	fwdz=null;
	String	sjs=null;
	String	zjxm=null;
	String	sgdmc=null;

	String	khlx=null;//1����ѯ��2��ǩ����3��δ֪
	String 	lywj=null;

	ls_sql="select khxm,DECODE(xb,'M','��','W','Ů') xb,fwdz,sjs,zjxm,sgdmc";
	ls_sql+=" FROM crm_khxx,sq_sgd";
	ls_sql+=" where khbh='"+khbh+"' and crm_khxx.sgd=sq_sgd.sgd(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));

		khlx="2";
		lywj=lywjml+"\\"+"in-"+xh+"-"+khbh+"-"+khxm+"��"+xb+"����ǩ����"+".wav";

		getStr2=xh+"";
		getStr2+="+"+khbh.trim();
		getStr2+="+"+khxm;
		getStr2+="+"+fwdz;
		getStr2+="+"+sjs;
		getStr2+="+"+zjxm;
		getStr2+="+"+sgdmc;
		getStr2+="+��"+xb+"����ǩ����";

		String	tsjlh=null;
		String	tsbxsj=null;
		String	tsnr=null;
		ls_sql="select tsjlh,tsbxsj,tsnr";
		ls_sql+=" from  crm_tsjl";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and clzt in('1','2')";//0��δ����1��������2���ڴ���3���᰸��9:������
		ls_sql+=" order by tsjlh desc";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			tsjlh=rs1.getString("tsjlh");
			tsbxsj=cf.fillNull(rs1.getDate("tsbxsj"));
			tsnr=rs1.getString("tsnr");

			getStr2+="+"+tsjlh;
			getStr2+="+"+tsbxsj;
			getStr2+="+"+tsnr;
		}
		else{
			getStr2+="+";
			getStr2+="+";
			getStr2+="+";
		}
		rs1.close();
		ps1.close();
	
	
	}
	else{
		rs.close();
		ps.close();

		ls_sql="select khxm,DECODE(xb,'M','��','W','Ů') xb,fwdz,sjs,zjxm,sgdmc";
		ls_sql+=" FROM crm_zxkhxx,sq_sgd";
		ls_sql+=" where khbh='"+khbh+"' and crm_zxkhxx.sgd=sq_sgd.sgd(+)";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khxm=cf.fillNull(rs.getString("khxm"));
			xb=cf.fillNull(rs.getString("xb"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			sjs=cf.fillNull(rs.getString("sjs"));
			zjxm=cf.fillNull(rs.getString("zjxm"));
			sgdmc=cf.fillNull(rs.getString("sgdmc"));

			khlx="1";
			lywj=lywjml+"\\"+"in-"+xh+"-"+khbh+"-"+khxm+"��"+xb+"����δǩ����"+".wav";


			getStr2=xh+"";
			getStr2+="+"+khbh.trim();
			getStr2+="+"+khxm;
			getStr2+="+"+fwdz;
			getStr2+="+"+sjs;
			getStr2+="+"+zjxm;
			getStr2+="+"+sgdmc;
			getStr2+="+��"+xb+"����δǩ����";

			String	tsjlh=null;
			String	tsbxsj=null;
			String	tsnr=null;
			ls_sql="select tsjlh,tsbxsj,tsnr";
			ls_sql+=" from  crm_tsjl";
			ls_sql+=" where khbh='"+khbh+"'";
			ls_sql+=" and clzt in('1','2')";//0��δ����1��������2���ڴ���3���᰸��9:������
			ls_sql+=" order by tsjlh desc";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				tsjlh=rs1.getString("tsjlh");
				tsbxsj=cf.fillNull(rs1.getDate("tsbxsj"));
				tsnr=rs1.getString("tsnr");

				getStr2+="+"+tsjlh;
				getStr2+="+"+tsbxsj;
				getStr2+="+"+tsnr;
			}
			else{
				getStr2+="+";
				getStr2+="+";
				getStr2+="+";
			}
			rs1.close();
			ps1.close();
		}
		else{
			khlx="3";
			lywj=lywjml+"\\"+"in-"+xh+"--δ֪�ͻ�.wav";

			getStr2=xh+"";
			getStr2+="+";
			getStr2+="+δ֪�ͻ�";
			getStr2+="+";
			getStr2+="+";
			getStr2+="+";
			getStr2+="+";
			getStr2+="+";
			getStr2+="+";
			getStr2+="+";
			getStr2+="+";
		}
	}
	rs.close();
	ps.close();



	ls_sql="update call_ldjl set khlx=?,lywj=? ";
	ls_sql+=" where xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khlx);
	ps.setString(2,lywj);
	ps.executeUpdate();
	ps.close();

	out.print(getStr2);
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>



