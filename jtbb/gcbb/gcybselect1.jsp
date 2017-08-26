<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>工程进度跟踪</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">工程月报表</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td width="7%">合同编号</td>
    <td width="6%">客户姓名</td>
    <td width="10%">联系电话</td>
    <td width="7%">年龄</td>
    <td width="7%">职业</td>
    <td width="5%">房价</td>
    <td width="6%">工程报价</td>
	<td width="7%">开工日期</td>
    <td width="7%">竣工日期</td>
    <td width="7%">总结算款</td>
    <td width="6%">设计师</td>
    <td width="6%">施工队</td>
    <td width="6%">质检</td>
    <td width="7%">工艺做法</td>
    <td width="6%">工程进度</td>
 </tr>
 
  
<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String px=request.getParameter("px");
String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String wheresql="";
if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String hth=null;
String khxm=null;
String fwdz=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String qyrq=null;
String pdsj=null;
String kgrq=null;
String sjkgrq=null;
String sybgcrq=null;
String szqsj=null;
String jgrq=null;
String gcjdbm=null;
String gcjdmc=null;
String pdclzt=null;
String ysbm=null;
String qye=null;
String bjjb=null;
String fj=null;
String zybm=null;
String nlqjmc=null;

int age=0;
int aa=0;
int bb=0;



String ys=null;
String ys1=null;
String ys2=null;
String ys3=null;
String ys4=null;

try {
	conn=cf.getConnection();
    
	int row=0;
	ls_sql="select hth,khxm,lxfs,sjs,zjxm,sgdmc sgd,to_char(qyrq,'yyyy') as bb,pdsj,kgrq,sjkgrq,sybgcrq,szqsj,jgrq,crm_khxx.gcjdbm,gcjdmc,pdclzt,ysmc,qye,DECODE(bjjb,'A','中级','B','中高级','C','峰翼') bjjb,fj,zymc,nlqjmc";
	ls_sql+=" from  crm_khxx,sq_sgd,dm_gcjdbm,dm_ysbm,dm_zybm,dm_nlqjbm";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm and crm_khxx.ysbm=dm_ysbm.ysbm(+) and crm_khxx.zybm=dm_zybm.zybm(+)";
	ls_sql+=" and crm_khxx.zt='2' and crm_khxx.gcjdbm!='1' and crm_khxx.gcjdbm!='5'";
	ls_sql+=" and crm_khxx.nlqjbm=dm_nlqjbm.nlqjbm(+)";
	ls_sql+=wheresql;
//	ls_sql+=" order by "+px;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	
	while (rs.next())
	{
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("lxfs");
		sjs=cf.fillHtml(rs.getString("sjs"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		sgd=cf.fillHtml(rs.getString("sgd"));
		qyrq=rs.getString("bb");
		nlqjmc=cf.fillHtml(rs.getString("nlqjmc"));
		pdsj=cf.fillHtml(rs.getDate("pdsj"));
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		sjkgrq=cf.fillHtml(rs.getDate("sjkgrq"));
		sybgcrq=cf.fillHtml(rs.getDate("sybgcrq"));
		szqsj=cf.fillHtml(rs.getDate("szqsj"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		gcjdmc=cf.fillNull(rs.getString("gcjdmc"));
		pdclzt=cf.fillNull(rs.getString("pdclzt"));
		ysbm=cf.fillNull(rs.getString("ysmc"));
		qye=cf.fillNull(rs.getString("qye"));
        bjjb=cf.fillHtml(rs.getString("bjjb"));
        fj=cf.fillNull(rs.getString("fj"));
		zybm=cf.fillHtml(rs.getString("zymc"));
		sjkgrq=cf.fillHtml(rs.getDate("sjkgrq"));

        
       //Calendar cal =Calendar.getInstance();
	  // Calendar day=Calendar.getInstance();

	// age=day.get(day.YEAR);
		//age=cal.get(cal.YEAR).toString(jgrq);
		
		row++;

		if (row%2==0)
		{
			ys="#E8E8FF";
		}
		else{
			ys="#FFFFFF";
		}

		if (pdclzt.equals("1"))
		{
			ys1="#FFFFFF";
			ys2="#FFFFFF";
			ys3="#FFFFFF";
			ys4="#FFFFFF";
		}
		else{
			ys1="#FF9999";
			ys2="#FFFFFF";
			ys3="#FFFFFF";
			ys4="#FFFFFF";
		}

		if (gcjdbm.equals("2"))//1：未开工；2： 材料进场；3：隐蔽工程验收；4： 中期验收；5:：完工
		{
			ys1="#FF9999";
			ys2="#FFCC99";
			ys3="#FFFFFF";
			ys4="#FFFFFF";
		}
		else if (gcjdbm.equals("3"))
		{
			ys1="#FF9999";
			ys2="#FFCC99";
			ys3="#CC99FF";
			ys4="#FFFFFF";
		}
		else if (gcjdbm.equals("4"))
		{
			ys1="#FF9999";
			ys2="#FFCC99";
			ys3="#CC99FF";
			ys4="#FF6699";
		}

%> 

  <tr align="center" bgcolor="<%=ys%>">
    <td><%=hth%></td>
    <td><%=khxm%></td>
    <td><%=fwdz%></td>
    <td><%=nlqjmc%></td>
    <td><%=zybm%></td>
    <td><%=fj%></td>
    <td><%=bjjb%></td>
    <td bgcolor="<%=ys1%>"><%=sjkgrq%></td>
    <td bgcolor="<%=ys1%>"><%=pdsj%></td>
    <td bgcolor="<%=ys1%>"><%=qye%></td>
    <td bgcolor="<%=ys2%>"><%=sjs%></td>
    <td bgcolor="<%=ys3%>"><%=sgd%></td>
    <td bgcolor="<%=ys4%>"><%=zjxm%></td>
    <td bgcolor="#FFFFFF"><%=ysbm%></td>
	<td bgcolor="#FFFFFF"><%=gcjdmc%></td>
  </tr>

  <%
	}
	rs.close();
	ps.close();


}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
</table>
</body>
</html>
