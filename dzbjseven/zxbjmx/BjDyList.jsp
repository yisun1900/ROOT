<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>

<head>
<style>
@media print{
	INPUT {display:none}
}
.STYLE1 {
	font-size: 18px;
	font-weight: bold;
}
</style>

</head>


<%
String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;

String xh=null;
String jgwzmc=null;
String jldwmc=null;
double dj=0;
double sl=0;
double qye=0;
String gycl=null;
String flmcgg=null;
String bjbz=null;
double xjqye=0;
double zjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;
double allzj=0;
double tcnzj=0;

double tcwzj=0;
double htzj=0;

String khxm=null;
String lxfs=null;
String fwdz=null;
//String hth=null;
String sjs=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjbbm=null;
String bjjbmc=null;
String ssfgs=null;
int fwmj=0;
String bjbbh=null;
String dqbm =null;
String hxbm =null;
String zxzt ="";
String sfxjz ="";


String dzbjbz=null;
Reader is=null;
BufferedReader br=null;

try {
	conn=cf.getConnection();


	
	ls_sql="SELECT khxm,lxfs,fwdz,sjs,crm_zxkhxx.bjjb,bjjbmc,ssfgs,fwmj,bjbbh,hxbm,zxzt,sfxjz";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
		bjjbbm=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		fwmj=rs.getInt("fwmj");
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		zxzt=cf.fillNull(rs.getString("zxzt"));
		sfxjz=cf.fillNull(rs.getString("sfxjz"));
	}
	rs.close();
	ps.close();

	oracle.sql.CLOB  clob=null;

	ls_sql="select dzbjbz1";
	ls_sql+=" from  bj_dzbjbz";
	ls_sql+=" where  (dwbh='"+ssfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clob=(oracle.sql.CLOB)rs.getClob("dzbjbz1");
	}
	rs.close();
	ps.close();

	dzbjbz="";

	if(clob!=null){
		is=clob.getCharacterStream();
		br=new BufferedReader(is);
		String s=br.readLine();
		while(s!=null)
		{
			dzbjbz+=s+",";
			s=br.readLine();
		}

		br.close();
		is.close();
	}

	if (dzbjbz==null)
	{
		dzbjbz="";
	}
	if (dzbjbz.length()>1)
	{
		dzbjbz=dzbjbz.substring(0,dzbjbz.length()-1);
	}
	else{
		dzbjbz="";
	}


	
	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillHtml(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	//精装价格表（bj_tcjgb）

	double mjpmdj=0;//平米单价
	int tnzxjjmj=0;//最小面积
	
	double cfdj=0;//厨房单价
	double cfbzmj=0;//厨房标准面积
	double cfccmjdj=0;//厨房超出面积单价
	
	double wsjdj=0;//卫生间单价
	double wsjbzmj=0;//卫生间标准面积
	double wsjccmjdj=0;//卫生间超出面积单价

	double tlgbzjmj=0;//厨房超出面积单价

	ls_sql="SELECT mjpmdj,tnzxjjmj,cfdj,cfbzmj,cfccmjdj,wsjdj,wsjbzmj,wsjccmjdj,tlgbzjmj";
	ls_sql+=" FROM tc_csrjkhjgb";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mjpmdj=rs.getInt("mjpmdj");
		tnzxjjmj=rs.getInt("tnzxjjmj");

		cfdj=rs.getDouble("cfdj");
		cfbzmj=rs.getDouble("cfbzmj");
		cfccmjdj=rs.getDouble("cfccmjdj");

		wsjdj=rs.getDouble("wsjdj");
		wsjbzmj=rs.getDouble("wsjbzmj");
		wsjccmjdj=rs.getDouble("wsjccmjdj");

		tlgbzjmj=rs.getDouble("tlgbzjmj");
	}
	rs.close();
	ps.close();


	int wsjsl=0;//卫生间数量
	double wsjmj=0;//卫生间面积
	ls_sql="SELECT count(*),sum(fjmj)";
	ls_sql+=" from  bj_fjxx";
    ls_sql+=" where khbh='"+khbh+"'";
    ls_sql+=" and fjlx=2";//1：厨房；2：卫生间
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wsjsl=rs.getInt(1);
		wsjmj=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	int cfsl=0;//厨房数量
	double cfmj=0;//厨房面积
	ls_sql="SELECT count(*),sum(fjmj)";
	ls_sql+=" from  bj_fjxx";
    ls_sql+=" where khbh='"+khbh+"'";
    ls_sql+=" and fjlx=1";//1：厨房；2：卫生间
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cfsl=rs.getInt(1);
		cfmj=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	double cfjg=0;//厨房价格
	String getjgwzbm=null;
	double getfjmj=0;
	String cfsm="";
	ls_sql="SELECT jgwzbm,fjmj";
	ls_sql+=" from  bj_fjxx";
    ls_sql+=" where khbh='"+khbh+"'";
    ls_sql+=" and fjlx=1";//1：厨房；2：卫生间
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getjgwzbm=rs.getString(1);
		getfjmj=rs.getDouble(2);

		double mjjj=0;
		if (getfjmj>cfbzmj)
		{
			mjjj=(getfjmj-cfbzmj)*cfccmjdj;
			mjjj=cf.round(mjjj,2);
		}

		cfjg+=cfdj+mjjj;

		cfsm+="<B>"+getjgwzbm+"</B>："+getfjmj+"平米、单价"+cfdj+"、面积超标加价"+mjjj+"<BR>";
	}
	rs.close();
	ps.close();

	double wsjjg=0;//卫生间价格
	String wsjsm="";

	ls_sql="SELECT jgwzbm,fjmj";
	ls_sql+=" from  bj_fjxx";
    ls_sql+=" where khbh='"+khbh+"'";
    ls_sql+=" and fjlx=2";//1：厨房；2：卫生间
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getjgwzbm=rs.getString(1);
		getfjmj=rs.getDouble(2);

		double mjjj=0;
		if (getfjmj>wsjbzmj)
		{
			mjjj=(getfjmj-wsjbzmj)*wsjccmjdj;
			mjjj=cf.round(mjjj,2);
		}

		wsjjg+=wsjdj+mjjj;

		wsjsm+="<B>"+getjgwzbm+"</B>："+getfjmj+"平米、单价"+wsjdj+"、面积超标加价"+mjjj+"<BR>";
	}
	rs.close();
	ps.close();

	if (fwmj<tnzxjjmj)//按最小面积计价
	{
		fwmj=tnzxjjmj;
	}
	//精装面积价格
	double tcmjjg=(fwmj-wsjmj-cfmj)*mjpmdj;
	tcmjjg=cf.round(tcmjjg,2);

	if (sfxjz.equals("Y"))
	{
		fwmj=0;
		tcmjjg=0;
	}
	else{
	}


	

	double zcsjcj=0;//主材升级差价
	ls_sql="SELECT ROUND(sum(dj*xdsl),2)";
	ls_sql+=" FROM tc_csrjkhzcqd";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcsjcj=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	double zcjmje=0;//主材减免

	//木门减免
	ls_sql="SELECT sum(sjjmje)";
	ls_sql+=" FROM tc_csrjkhmmjmj";
    ls_sql+=" where khbh='"+khbh+"' ";
    ls_sql+=" and sjjmsl>0";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcjmje+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//橱柜减免
	ls_sql="SELECT sum(sjjmje)";
	ls_sql+=" FROM tc_csrjkhcgjmj";
    ls_sql+=" where khbh='"+khbh+"' ";
    ls_sql+=" and sjjmsl>0";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcjmje+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//洁具减免
	ls_sql="SELECT sum(sjjmje)";
	ls_sql+=" FROM tc_csrjkhjjjmj";
    ls_sql+=" where khbh='"+khbh+"' ";
    ls_sql+=" and sjjmsl>0";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcjmje+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//磁砖减免
	ls_sql="SELECT sum(sjjmje)";
	ls_sql+=" FROM tc_csrjkhczjmj";
    ls_sql+=" where khbh='"+khbh+"' ";
    ls_sql+=" and sjjmsl>0";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcjmje+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//铝扣板减免
	ls_sql="SELECT sum(sjjmje)";
	ls_sql+=" FROM tc_csrjkhlkbjmj";
    ls_sql+=" where khbh='"+khbh+"' ";
    ls_sql+=" and sjjmsl>0";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcjmje+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//地板减免
	ls_sql="SELECT sum(sjjmje)";
	ls_sql+=" FROM tc_csrjkhdbjmj";
    ls_sql+=" where khbh='"+khbh+"' ";
    ls_sql+=" and sjjmsl>0";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcjmje+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//客户衣柜减免价
	ls_sql="SELECT sum(sjjmje)";
	ls_sql+=" FROM tc_csrjkhygjmj";
    ls_sql+=" where khbh='"+khbh+"' ";
    ls_sql+=" and sjjmsl>0";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcjmje+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//客户五金电器减免价
	ls_sql="SELECT sum(sjjmje)";
	ls_sql+=" FROM tc_csrjkhwjdqjmj";
    ls_sql+=" where khbh='"+khbh+"' ";
    ls_sql+=" and sjjmsl>0";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcjmje+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//客户过门石减免价
	ls_sql="SELECT sum(sjjmje)";
	ls_sql+=" FROM tc_csrjkhgmsjmj";
    ls_sql+=" where khbh='"+khbh+"' ";
    ls_sql+=" and sjjmsl>0";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcjmje+=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	//主材减免
	zcjmje=cf.round(zcjmje,2);
	zcjmje=-1*zcjmje;



	//精装外施工项造价
	double tcwgczj=0;

	//1：工程类（与其它收费项目相关）；2：工程类（与其它收费项目无关）；3：主材类
	ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
	ls_sql+=" FROM bj_bjxmmx,bj_gclmx";
	ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ls_sql+=" and (bj_bjxmmx.tcnxmbz='N' OR bj_bjxmmx.tcnxmbz is null)";//Y：是；N：否
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcwgczj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//工程超量加价
	double gccljj=0;

	String xmbh =null;
	String sfxzsl =null;
	double bzsl=0;
	double ccbfjj=0;
	ls_sql="SELECT tc_csrjkhgcxmxj.xmbh,tc_csrjkhgcxmxj.bzsl,tc_csrjkhgcxmxj.sfxzsl,bj_bjxmmx.zqdj";
	ls_sql+=" from  tc_csrjkhgcxmxj,bj_bjxmmx";
	ls_sql+=" where tc_csrjkhgcxmxj.khbh=bj_bjxmmx.khbh and tc_csrjkhgcxmxj.xmbh=bj_bjxmmx.xmbh ";
    ls_sql+=" and tc_csrjkhgcxmxj.khbh='"+khbh+"' and tc_csrjkhgcxmxj.tcnxmbz='Y'";//精装内项目标志
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmbh=rs.getString("xmbh");
		sfxzsl=rs.getString("sfxzsl");
		bzsl=rs.getDouble("bzsl");
		ccbfjj=rs.getDouble("zqdj");

		double sjsl=0;
		ls_sql="SELECT sum(bj_gclmx.sl)";
		ls_sql+=" FROM bj_gclmx";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjsl=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();


		double xjjsl=0;//加价数量

		if (sfxzsl.equals("1"))//1：可增项；2：不可增项；3：不控制
		{
			if (sjsl>bzsl)
			{
				xjjsl=sjsl-bzsl;
			}
			else{
				xjjsl=0;
			}
		}
		else if (sfxzsl.equals("2"))//1：可增项；2：不可增项；3：不控制
		{
			if (sjsl>bzsl)
			{
				out.println("<BR>错误！项目编号『"+xmbh+"』不可增项，[实际数量："+sjsl+"]超出[标准数量："+bzsl+"]");
			}
		}


		ls_sql="update tc_csrjkhgcxmxj set sjsl="+sjsl+",xjjsl="+xjjsl;
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		gccljj+=ccbfjj*xjjsl;
		gccljj=cf.round(gccljj,2);

	}
	rs.close();
	ps.close();

	tcwgczj=cf.round(tcwgczj+gccljj,2);


	//精装面积价格＋厨房价格＋卫生间价格＋主材升级差价-主材减免+精装外施工项造价
	double tcze=0;
	tcze=tcmjjg+cfjg+wsjjg+zcsjcj+zcjmje+tcwgczj;
	tcze=cf.round(tcze,2);


%>
<body >

<div align="center" class="STYLE1">（<%=bjjbmc%>）预览总价</div>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF"> 
    <td width="30%" >客户姓名：<%=khxm%></td>
    <td width="49%" >客户地址：<%=fwdz%></td>
    <td width="21%" >面积：<%=fwmj%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
  <tr align="center"  >
    <td ><strong>序号</strong></td>
    <td ><strong>项目</strong></td>
    <td ><strong>金额（元）</strong></td>
    <td ><strong>备注</strong></td>
  </tr>
  <tr align="center"  >
    <td width="5%"  >①</td>
    <td width="25%"  >精装面积价格</td>
    <td width="20%"  ><%=tcmjjg%></td>
    <td width="50%" align="left" >面积<%=cf.round(fwmj-wsjmj-cfmj,2)%>平米，每平米<%=mjpmdj%>元</td>
  </tr>
  
  <tr align="center"  >
    <td  >②</td>
    <td  >厨房价格</td>
    <td  ><%=cfjg%></td>
    <td align="left" ><%=cfsm%></td>
  </tr>
  <tr align="center"  >
    <td  >③</td>
    <td  >卫生间价格</td>
    <td  ><%=wsjjg%></td>
    <td align="left" ><%=wsjsm%></td>
  </tr>
  <tr align="center"  >
    <td  >④</td>
    <td  >主材升级差价</td>
    <td  ><%=zcsjcj%></td>
    <td align="left" >&nbsp;</td>
  </tr>
  
  
  <tr align="center"  >
    <td  >⑤</td>
    <td >主材减免</td>
    <td ><%=zcjmje%></td>
    <td align="left" >&nbsp;</td>
  </tr>
  
  <tr align="center"  >
    <td  >⑥</td>
    <td >精装外施工项造价</td>
    <td ><%=tcwgczj%></td>
    <td align="left" >&nbsp;</td>
  </tr>
  

  <tr bgcolor="#FFFFFF" align="center"  height="31">
	<td>&nbsp;</td>
	<td>精装报价合计</td>
	<td><%=tcze%></td>
	<td align="left" >&nbsp;</td>
  </tr>
 
 
<%
	double tczj=tcze;

	String sfxmbm=null;
	String sfxmmc=null;

	double sfbfb=0;
	double sfje=0;
	double zqsfje=0;

	ls_sql="SELECT sfxmbm,sfxmmc,sfbfb,sfje,zqsfje";
	ls_sql+=" FROM bj_sfxmmx  ";
    ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
    ls_sql+=" order by bj_sfxmmx.sfxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmbm=cf.fillHtml(rs.getString("sfxmbm"));
		sfxmmc=cf.fillHtml(rs.getString("sfxmmc"));
		sfbfb=rs.getDouble("sfbfb");
		sfje=rs.getDouble("sfje");
		zqsfje=rs.getDouble("zqsfje");

		tczj+=zqsfje;

		%> 
		  <tr bgcolor="#FFFFFF" align="center"  height="31"> 
			<td>&nbsp;</td>
			<td><%=sfxmmc%></td>
			<td><%=cf.formatDouble(zqsfje,"#########.##")%></td>
			<td align="left" >&nbsp;</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	tczj=cf.round(tczj,2);

%>
  <tr align="center"  >
    <td>&nbsp;</td>
    <td  >总价合计</td>
    <td><%=tczj%></td>
    <td align="left" >&nbsp;</td>
  </tr>
</table>

<%
if (zcjmje!=0)
{
	%>
	<P><center>主材减免清单</center>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
	  <tr bgcolor="#FFFFFF" align="center"> 
		<td  width="6%">序号</td>
		<td  width="20%">产品大类</td>
		<td  width="20%">产品类别</td>
		<td  width="12%">计量单位</td>
		<td  width="12%">减免单价</td>
		<td  width="12%">减免数量</td>
		<td  width="16%">减免金额</td>
	  </tr>

		
	<%
		String cldlmc=null;
		String tccplbmc=null;
		String jldw=null;
		double jmdj=0;
		double sjjmsl=0;
		double sjjmje=0;

		allsl=0;
		double allje=0;

		ls_sql="SELECT jxc_cldlbm.cldlmc,clxlmc,jldw,jmdj,sjjmsl,sjjmje";
		ls_sql+=" FROM tc_csrjkhmmjmj,jxc_cldlbm,jxc_clxlbm ";
		ls_sql+=" where tc_csrjkhmmjmj.tccpdlbm=jxc_cldlbm.cldlbm(+)";
		ls_sql+=" and tc_csrjkhmmjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
		ls_sql+=" and tc_csrjkhmmjmj.khbh='"+khbh+"' ";
		ls_sql+=" and tc_csrjkhmmjmj.sjjmsl>0";
		ls_sql+=" order by tc_csrjkhmmjmj.tccpdlbm,tc_csrjkhmmjmj.tccplbbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			cldlmc=rs.getString("cldlmc");
			tccplbmc=rs.getString("clxlmc");
			jldw=rs.getString("jldw");
			jmdj=rs.getDouble("jmdj");
			sjjmsl=rs.getDouble("sjjmsl");
			sjjmje=rs.getDouble("sjjmje");

			allsl+=sjjmsl;
			allje+=sjjmje;

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF"  align="center"> 
				<td ><%=row%></td>
				<td ><%=cldlmc%></td>
				<td><%=tccplbmc%></td>
				<td><%=jldw%></td>
				<td><%=cf.formatDouble(-1*jmdj)%></td>
				<td><%=cf.formatDouble(sjjmsl)%></td>
				<td><%=cf.formatDouble(-1*sjjmje)%></td>
			  </tr>
			  
		
			<%
		}
		rs.close();
		ps.close();



		ls_sql="SELECT jxc_cldlbm.cldlmc,clxlmc,jldw,jmdj,sjjmsl,sjjmje";
		ls_sql+=" FROM tc_csrjkhcgjmj,jxc_cldlbm,jxc_clxlbm ";
		ls_sql+=" where tc_csrjkhcgjmj.tccpdlbm=jxc_cldlbm.cldlbm(+)";
		ls_sql+=" and tc_csrjkhcgjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
		ls_sql+=" and tc_csrjkhcgjmj.khbh='"+khbh+"' ";
		ls_sql+=" and tc_csrjkhcgjmj.sjjmsl>0";
		ls_sql+=" order by tc_csrjkhcgjmj.tccpdlbm,tc_csrjkhcgjmj.tccplbbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			cldlmc=rs.getString("cldlmc");
			tccplbmc=rs.getString("clxlmc");
			jldw=rs.getString("jldw");
			jmdj=rs.getDouble("jmdj");
			sjjmsl=rs.getDouble("sjjmsl");
			sjjmje=rs.getDouble("sjjmje");

			allsl+=sjjmsl;
			allje+=sjjmje;

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF"  align="center"> 
				<td ><%=row%></td>
				<td ><%=cldlmc%></td>
				<td><%=tccplbmc%></td>
				<td><%=jldw%></td>
				<td><%=cf.formatDouble(-1*jmdj)%></td>
				<td><%=cf.formatDouble(sjjmsl)%></td>
				<td><%=cf.formatDouble(-1*sjjmje)%></td>
			  </tr>
			  
		
			<%
		}
		rs.close();
		ps.close();


		ls_sql="SELECT jxc_cldlbm.cldlmc,clxlmc,jldw,jmdj,sjjmsl,sjjmje";
		ls_sql+=" FROM tc_csrjkhjjjmj,jxc_cldlbm,jxc_clxlbm ";
		ls_sql+=" where tc_csrjkhjjjmj.tccpdlbm=jxc_cldlbm.cldlbm(+)";
		ls_sql+=" and tc_csrjkhjjjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
		ls_sql+=" and tc_csrjkhjjjmj.khbh='"+khbh+"' ";
		ls_sql+=" and tc_csrjkhjjjmj.sjjmsl>0";
		ls_sql+=" order by tc_csrjkhjjjmj.tccpdlbm,tc_csrjkhjjjmj.tccplbbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			cldlmc=rs.getString("cldlmc");
			tccplbmc=rs.getString("clxlmc");
			jldw=rs.getString("jldw");
			jmdj=rs.getDouble("jmdj");
			sjjmsl=rs.getDouble("sjjmsl");
			sjjmje=rs.getDouble("sjjmje");

			allsl+=sjjmsl;
			allje+=sjjmje;

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF"  align="center"> 
				<td ><%=row%></td>
				<td ><%=cldlmc%></td>
				<td><%=tccplbmc%></td>
				<td><%=jldw%></td>
				<td><%=cf.formatDouble(-1*jmdj)%></td>
				<td><%=cf.formatDouble(sjjmsl)%></td>
				<td><%=cf.formatDouble(-1*sjjmje)%></td>
			  </tr>
			  
		
			<%
		}
		rs.close();
		ps.close();

		ls_sql="SELECT jxc_cldlbm.cldlmc,clxlmc,jldw,jmdj,sjjmsl,sjjmje";
		ls_sql+=" FROM tc_csrjkhczjmj,jxc_cldlbm,jxc_clxlbm ";
		ls_sql+=" where tc_csrjkhczjmj.tccpdlbm=jxc_cldlbm.cldlbm(+)";
		ls_sql+=" and tc_csrjkhczjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
		ls_sql+=" and tc_csrjkhczjmj.khbh='"+khbh+"' ";
		ls_sql+=" and tc_csrjkhczjmj.sjjmsl>0";
		ls_sql+=" order by tc_csrjkhczjmj.tccpdlbm,tc_csrjkhczjmj.tccplbbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			cldlmc=rs.getString("cldlmc");
			tccplbmc=rs.getString("clxlmc");
			jldw=rs.getString("jldw");
			jmdj=rs.getDouble("jmdj");
			sjjmsl=rs.getDouble("sjjmsl");
			sjjmje=rs.getDouble("sjjmje");

			allsl+=sjjmsl;
			allje+=sjjmje;

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF"  align="center"> 
				<td ><%=row%></td>
				<td ><%=cldlmc%></td>
				<td><%=tccplbmc%></td>
				<td><%=jldw%></td>
				<td><%=cf.formatDouble(-1*jmdj)%></td>
				<td><%=cf.formatDouble(sjjmsl)%></td>
				<td><%=cf.formatDouble(-1*sjjmje)%></td>
			  </tr>
			  
		
			<%
		}
		rs.close();
		ps.close();

		ls_sql="SELECT jxc_cldlbm.cldlmc,clxlmc,jldw,jmdj,sjjmsl,sjjmje";
		ls_sql+=" FROM tc_csrjkhlkbjmj,jxc_cldlbm,jxc_clxlbm ";
		ls_sql+=" where tc_csrjkhlkbjmj.tccpdlbm=jxc_cldlbm.cldlbm(+)";
		ls_sql+=" and tc_csrjkhlkbjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
		ls_sql+=" and tc_csrjkhlkbjmj.khbh='"+khbh+"' ";
		ls_sql+=" and tc_csrjkhlkbjmj.sjjmsl>0";
		ls_sql+=" order by tc_csrjkhlkbjmj.tccpdlbm,tc_csrjkhlkbjmj.tccplbbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			cldlmc=rs.getString("cldlmc");
			tccplbmc=rs.getString("clxlmc");
			jldw=rs.getString("jldw");
			jmdj=rs.getDouble("jmdj");
			sjjmsl=rs.getDouble("sjjmsl");
			sjjmje=rs.getDouble("sjjmje");

			allsl+=sjjmsl;
			allje+=sjjmje;

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF"  align="center"> 
				<td ><%=row%></td>
				<td ><%=cldlmc%></td>
				<td><%=tccplbmc%></td>
				<td><%=jldw%></td>
				<td><%=cf.formatDouble(-1*jmdj)%></td>
				<td><%=cf.formatDouble(sjjmsl)%></td>
				<td><%=cf.formatDouble(-1*sjjmje)%></td>
			  </tr>
			  
		
			<%
		}
		rs.close();
		ps.close();

		ls_sql="SELECT jxc_cldlbm.cldlmc,clxlmc,jldw,jmdj,sjjmsl,sjjmje";
		ls_sql+=" FROM tc_csrjkhdbjmj,jxc_cldlbm,jxc_clxlbm ";
		ls_sql+=" where tc_csrjkhdbjmj.tccpdlbm=jxc_cldlbm.cldlbm(+)";
		ls_sql+=" and tc_csrjkhdbjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
		ls_sql+=" and tc_csrjkhdbjmj.khbh='"+khbh+"' ";
		ls_sql+=" and tc_csrjkhdbjmj.sjjmsl>0";
		ls_sql+=" order by tc_csrjkhdbjmj.tccpdlbm,tc_csrjkhdbjmj.tccplbbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			cldlmc=rs.getString("cldlmc");
			tccplbmc=rs.getString("clxlmc");
			jldw=rs.getString("jldw");
			jmdj=rs.getDouble("jmdj");
			sjjmsl=rs.getDouble("sjjmsl");
			sjjmje=rs.getDouble("sjjmje");

			allsl+=sjjmsl;
			allje+=sjjmje;

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF"  align="center"> 
				<td ><%=row%></td>
				<td ><%=cldlmc%></td>
				<td><%=tccplbmc%></td>
				<td><%=jldw%></td>
				<td><%=cf.formatDouble(-1*jmdj)%></td>
				<td><%=cf.formatDouble(sjjmsl)%></td>
				<td><%=cf.formatDouble(-1*sjjmje)%></td>
			  </tr>
			  
		
			<%
		}
		rs.close();
		ps.close();

		ls_sql="SELECT jxc_cldlbm.cldlmc,clxlmc,jldw,jmdj,sjjmsl,sjjmje";
		ls_sql+=" FROM tc_csrjkhygjmj,jxc_cldlbm,jxc_clxlbm ";
		ls_sql+=" where tc_csrjkhygjmj.tccpdlbm=jxc_cldlbm.cldlbm(+)";
		ls_sql+=" and tc_csrjkhygjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
		ls_sql+=" and tc_csrjkhygjmj.khbh='"+khbh+"' ";
		ls_sql+=" and tc_csrjkhygjmj.sjjmsl>0";
		ls_sql+=" order by tc_csrjkhygjmj.tccpdlbm,tc_csrjkhygjmj.tccplbbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			cldlmc=rs.getString("cldlmc");
			tccplbmc=rs.getString("clxlmc");
			jldw=rs.getString("jldw");
			jmdj=rs.getDouble("jmdj");
			sjjmsl=rs.getDouble("sjjmsl");
			sjjmje=rs.getDouble("sjjmje");

			allsl+=sjjmsl;
			allje+=sjjmje;

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF"  align="center"> 
				<td ><%=row%></td>
				<td ><%=cldlmc%></td>
				<td><%=tccplbmc%></td>
				<td><%=jldw%></td>
				<td><%=cf.formatDouble(-1*jmdj)%></td>
				<td><%=cf.formatDouble(sjjmsl)%></td>
				<td><%=cf.formatDouble(-1*sjjmje)%></td>
			  </tr>
			  
		
			<%
		}
		rs.close();
		ps.close();

		ls_sql="SELECT jxc_cldlbm.cldlmc,clxlmc,jldw,jmdj,sjjmsl,sjjmje";
		ls_sql+=" FROM tc_csrjkhwjdqjmj,jxc_cldlbm,jxc_clxlbm ";
		ls_sql+=" where tc_csrjkhwjdqjmj.tccpdlbm=jxc_cldlbm.cldlbm(+)";
		ls_sql+=" and tc_csrjkhwjdqjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
		ls_sql+=" and tc_csrjkhwjdqjmj.khbh='"+khbh+"' ";
		ls_sql+=" and tc_csrjkhwjdqjmj.sjjmsl>0";
		ls_sql+=" order by tc_csrjkhwjdqjmj.tccpdlbm,tc_csrjkhwjdqjmj.tccplbbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			cldlmc=rs.getString("cldlmc");
			tccplbmc=rs.getString("clxlmc");
			jldw=rs.getString("jldw");
			jmdj=rs.getDouble("jmdj");
			sjjmsl=rs.getDouble("sjjmsl");
			sjjmje=rs.getDouble("sjjmje");

			allsl+=sjjmsl;
			allje+=sjjmje;

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF"  align="center"> 
				<td ><%=row%></td>
				<td ><%=cldlmc%></td>
				<td><%=tccplbmc%></td>
				<td><%=jldw%></td>
				<td><%=cf.formatDouble(-1*jmdj)%></td>
				<td><%=cf.formatDouble(sjjmsl)%></td>
				<td><%=cf.formatDouble(-1*sjjmje)%></td>
			  </tr>
			  
		
			<%
		}
		rs.close();
		ps.close();

		ls_sql="SELECT jxc_cldlbm.cldlmc,clxlmc,jldw,jmdj,sjjmsl,sjjmje";
		ls_sql+=" FROM tc_csrjkhgmsjmj,jxc_cldlbm,jxc_clxlbm ";
		ls_sql+=" where tc_csrjkhgmsjmj.tccpdlbm=jxc_cldlbm.cldlbm(+)";
		ls_sql+=" and tc_csrjkhgmsjmj.tccplbbm=jxc_clxlbm.clxlbm(+)";
		ls_sql+=" and tc_csrjkhgmsjmj.khbh='"+khbh+"' ";
		ls_sql+=" and tc_csrjkhgmsjmj.sjjmsl>0";
		ls_sql+=" order by tc_csrjkhgmsjmj.tccpdlbm,tc_csrjkhgmsjmj.tccplbbm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			cldlmc=rs.getString("cldlmc");
			tccplbmc=rs.getString("clxlmc");
			jldw=rs.getString("jldw");
			jmdj=rs.getDouble("jmdj");
			sjjmsl=rs.getDouble("sjjmsl");
			sjjmje=rs.getDouble("sjjmje");

			allsl+=sjjmsl;
			allje+=sjjmje;

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF"  align="center"> 
				<td ><%=row%></td>
				<td ><%=cldlmc%></td>
				<td><%=tccplbmc%></td>
				<td><%=jldw%></td>
				<td><%=cf.formatDouble(-1*jmdj)%></td>
				<td><%=cf.formatDouble(sjjmsl)%></td>
				<td><%=cf.formatDouble(-1*sjjmje)%></td>
			  </tr>
			  
		
			<%
		}
		rs.close();
		ps.close();
	%> 
			
	  <tr bgcolor="#FFFFFF"  align="center"> 
		<td colspan="2">合计</td>

		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=cf.formatDouble(allsl)%></td>
		<td><%=cf.formatDouble(-1*allje)%></td>
	   </tr>
	</table>

	<%
}
%>

<P>
温馨提示：<BR>
<%=dzbjbz%>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






