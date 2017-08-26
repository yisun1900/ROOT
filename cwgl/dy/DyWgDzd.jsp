<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>完工对账单</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<%
String khbh=request.getParameter("khbh");

///////////////基础数据
String sgd=null;
String sgdmc=null;
String khlx=null;
String cxhdbm=null;
double zkl=0;
double wdzgce=0;
double qye=0;
double zjxje=0;
double zhzjxje=0;
double zqwgzj=0;
double zhwgzj=0;
double khsskze=0;
double glftd=0;
double glf=0;
double gdjskze=0;

///////////////代扣款项目
double clf=0;
double bzclfbl=0;
double xbclk=0;
double psgjgff=0;
double ysf=0;
double wxjbfb=0;
double wxj=0;
double gcjxkk=0;
double sj=0;
double lbcb=0;
double kqtk=0;

///////////////结算金额
double jkje=0;
double sqgz=0;
double gczxjl=0;
double ycfbk=0;

String jslx=null;
String jsr=null;
String jsdw=null;
String jssj=null;
String bz=null;


String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String hth=null;
String qyrq=null;
String kgrq=null;
String sjkgrq=null;
String jgrq=null;
String sjjgrq=null;
String sjwjrq=null;
String dwbh=null;
String fgsmc=null;
String zjxm=null;
String jzbz=null;
String zjxwcbz=null;
String fgsbh=null;
String gdjsjlh=null;

double wgzj=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	ls_sql="select gdjsjlh,sgd,khlx,cxhdbm,zkl,wdzgce,qye,zjxje,zhzjxje ";
	ls_sql+=" ,zqwgzj,zhwgzj,khsskze,glftd,glf,gdjskze,clf,bzclfbl,xbclk,psgjgff ";
	ls_sql+=" ,ysf,wxjbfb,wxj,gcjxkk,sj,lbcb,kqtk,jkje,sqgz,gczxjl ";
	ls_sql+=" ,ycfbk,jslx,jsdw,jsr,jssj,bz,jsjd,fkbz ";
	ls_sql+=" from  cw_gdjsjl";
	ls_sql+=" where khbh='"+khbh+"' and jslx='1'";//1：完工结算；2：中期结算
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gdjsjlh=cf.fillNull(rs.getString("gdjsjlh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		khlx=cf.fillNull(rs.getString("khlx"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		zkl=rs.getDouble("zkl");
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		zjxje=rs.getDouble("zjxje");
		zhzjxje=rs.getDouble("zhzjxje");

		zqwgzj=rs.getDouble("zqwgzj");
		zhwgzj=rs.getDouble("zhwgzj");
		khsskze=rs.getDouble("khsskze");
		glftd=rs.getDouble("glftd");
		glf=rs.getDouble("glf");
		gdjskze=rs.getDouble("gdjskze");
		clf=rs.getDouble("clf");
		bzclfbl=rs.getDouble("bzclfbl");
		xbclk=rs.getDouble("xbclk");
		psgjgff=rs.getDouble("psgjgff");

		ysf=rs.getDouble("ysf");
		wxjbfb=rs.getDouble("wxjbfb");
		wxj=rs.getDouble("wxj");
		gcjxkk=rs.getDouble("gcjxkk");
		sj=rs.getDouble("sj");
		lbcb=rs.getDouble("lbcb");
		kqtk=rs.getDouble("kqtk");
		jkje=rs.getDouble("jkje");
		sqgz=rs.getDouble("sqgz");
		gczxjl=rs.getDouble("gczxjl");

		ycfbk=rs.getDouble("ycfbk");
		jslx=cf.fillNull(rs.getString("jslx"));
		jsdw=cf.fillNull(rs.getString("jsdw"));
		jsr=cf.fillNull(rs.getString("jsr"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();


	ls_sql="select qye,zjxje,zhzjxje,fgsbh,jzbz,khxm,fwdz,lxfs,sjs,hth,qyrq,crm_khxx.dwbh,dwmc,crm_khxx.sgd,sgdmc,zjxm,kgrq,sjkgrq,jgrq,sjjgrq,sjwjrq";
	ls_sql+=" from  crm_khxx,sq_sgd,sq_dwxx";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.fgsbh=sq_dwxx.dwbh and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		fgsmc=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));

		qye=rs.getDouble("qye");
		zjxje=rs.getDouble("zjxje");
		zhzjxje=rs.getDouble("zhzjxje");
	
	}
	rs.close();
	ps.close();

	wgzj=cf.doubleTrim(qye+zhzjxje);


	ls_sql="update crm_khxx set wgdybz='Y',wgdysj=SYSDATE ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

%>
<body bgcolor="#FFFFFF">
<table width="100%" border="1" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
  <tr> 
    <td colspan="6" align="center" height="28"><b>龙 发 装 饰 集 团</b></td>
  </tr>
  <tr> 
    <td colspan="6" align="center" height="30"><b><%=fgsmc%>完工对账单</b></td>
  </tr>
  <tr> 
    <td colspan="2">工长姓名：<%=sgdmc%></td>
    <td colspan="2">合同号：<%=hth%></td>
    <td colspan="2" width="34%">客户名：<%=khxm%>(<%=khbh%>)</td>
  </tr>
  <tr> 
    <td colspan="2">完工造价：<%=wgzj%></td>
    <td colspan="2">管理费比例：<%=glftd%>%</td>
    <td colspan="2" width="34%">折扣或活动成本比率：<%=zkl%></td>
  </tr>
  <tr> 
    <td colspan="2">客户参加活动：<%=cxhdbm%></td>
    <td colspan="2">对帐单截止日：<%=jssj%></td>
    <td colspan="2" width="34%">对账单打印日：<%=cf.today()%></td>
  </tr>
  <tr> 
    <td colspan="6"><b>应付工费：<%=gdjskze%>元，其中：</b></td>
  </tr>
</table>
<table width="100%" border="0" style="FONT-SIZE:14" cellpadding="0" cellspacing="0">
  <tr>
    <td width="66%">
		
      <table width="100%" border="1" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
        <tr> 
          <td colspan="4" align="center"><b>代 扣 款 项 目</b></td>
        </tr>
        <tr> 
          <td width="18%"> 
            <div align="center">项目名称</div>          </td>
          <td width="15%"> 
            <div align="center">扣款金额（元）</div>          </td>
          <td width="17%"> 
            <div align="center">项目名称</div>          </td>
          <td width="16%"> 
            <div align="center">扣款金额（元）</div>          </td>
        </tr>
        <tr> 
          <td width="18%" align="center">材料费：</td>
          <td width="15%"><%=clf%></td>
          <td width="17%" align="center">材料扣款：</td>
          <td width="16%"><%=xbclk%></td>
        </tr>
        <tr> 
          <td width="18%" align="center">配送工具工服费：</td>
          <td width="15%"><%=psgjgff%></td>
          <td width="17%" align="center">运输费：</td>
          <td width="16%"><%=ysf%></td>
        </tr>
        <tr> 
          <td width="18%" align="center">扣质保金：</td>
          <td width="15%"><%=wxj%></td>
          <td width="17%" align="center">工程减项扣款：</td>
          <td width="16%"><%=gcjxkk%></td>
        </tr>
        <tr> 
          <td width="18%" align="center">税金：</td>
          <td width="15%"><%=sj%></td>
          <td width="17%" align="center">立邦成本：</td>
          <td width="16%"><%=lbcb%></td>
        </tr>
        <tr> 
          <td width="18%" align="center">其它扣款：</td>
          <td width="15%"><%=kqtk%></td>
          <td width="17%" align="center">&nbsp;</td>
          <td width="16%">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="4">代扣款金额小计 ：<%=clf+xbclk+psgjgff+ysf+wxj+gcjxkk+sj+lbcb+kqtk%>元</td>
        </tr>
      </table>
	
	</td>
    <td width="34%">
		
      <table width="100%" border="1" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
        <tr> 
          <td colspan="2" align="center"><b>实 际 已 拨 工 费</b></td>
        </tr>
        <tr> 
          <td width="50%"> 
            <div align="center">付款日期</div>
          </td>
          <td width="50%"> 
            <div align="center">付款金额（元）</div>
          </td>
        </tr>
 <%
	String jklxmc=null;
	String jkblsj=null;
	double alljkje=0;
	int row=0;
	ls_sql="select jklxmc,jkblsj,jkje";
	ls_sql+=" from  cw_gdjkjl,dm_jklxbm";
	ls_sql+=" where cw_gdjkjl.jklx=dm_jklxbm.jklxbm and khbh='"+khbh+"' and scbz='N' and jklx in('3','4')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jklxmc=cf.fillNull(rs.getString("jklxmc"));
		jkblsj=cf.fillNull(rs.getDate("jkblsj"));
		jkje=rs.getDouble("jkje");

		alljkje+=jkje;

		row++;

		%>
        <tr> 
          <td width="50%" align="center"><%=jkblsj%></td>
          <td width="50%"><%=jkje%></td>
        </tr>
		<%
	}
	rs.close();
	ps.close();

	for (int i=row;i<5;i++)
	{
		%>
        <tr> 
          <td width="50%" align="center">&nbsp;</td>
          <td width="50%">&nbsp;</td>
        </tr>
		<%
	}

%>
        <tr> 
          <td colspan="2">已拨工费小计：<%=alljkje%>元</td>
        </tr>
      </table>
	
	</td>
  </tr>
</table>
<table width="100%" border="0" style="FONT-SIZE:14" cellpadding="0" cellspacing="0">
  <tr>
    <td width="25%" height="15" align="left" valign="top"> 
      <table width="100%" border="1" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
        <tr> 
          <td colspan="2" align="center" height="25"><b>远 程 费 拨 款（元）</b></td>
        </tr>
        <%
	alljkje=0;
	ls_sql="select jklxmc,jkblsj,jkje";
	ls_sql+=" from  cw_gdjkjl,dm_jklxbm";
	ls_sql+=" where cw_gdjkjl.jklx=dm_jklxbm.jklxbm and khbh='"+khbh+"' and scbz='N' and jklx='5'";//1：生活费；2：材料款；3：中期拨款；4：完工拨款；5：远程费拨款；6：工程增项奖励；9：其它;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jklxmc=cf.fillNull(rs.getString("jklxmc"));
		jkblsj=cf.fillNull(rs.getDate("jkblsj"));
		jkje=rs.getDouble("jkje");

		alljkje+=jkje;

		%> 
        <tr> 
          <td >日期：<%=jkblsj%></td>
          <td width="45%">金额：<%=jkje%></td>
        </tr>
        <%
	}
	rs.close();
	ps.close();


%> 
        <tr> 
          <td colspan="2">已拨远程费小计：<%=cf.formatDouble(alljkje)%>元</td>
        </tr>
      </table>
    </td>
    <td width="25%" height="15" align="left" valign="top"> 
      <table width="100%" border="1" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
        <tr align="center"> 
          <td colspan="2" height="25"><b>工程增项奖励款（元）</b></td>
        </tr>
        <%
	alljkje=0;
	ls_sql="select jklxmc,jkblsj,jkje";
	ls_sql+=" from  cw_gdjkjl,dm_jklxbm";
	ls_sql+=" where cw_gdjkjl.jklx=dm_jklxbm.jklxbm and khbh='"+khbh+"' and scbz='N' and jklx='6'";//1：生活费；2：材料款；3：中期拨款；4：完工拨款；5：远程费拨款；6：工程增项奖励；9：其它;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jklxmc=cf.fillNull(rs.getString("jklxmc"));
		jkblsj=cf.fillNull(rs.getDate("jkblsj"));
		jkje=rs.getDouble("jkje");

		alljkje+=jkje;

		%> 
        <tr> 
          <td >日期：<%=jkblsj%></td>
          <td width="45%">金额：<%=jkje%></td>
        </tr>
        <%
	}
	rs.close();
	ps.close();


%> 
        <tr> 
          <td colspan="2">已拨增项奖励小计：<%=cf.formatDouble(alljkje)%>元</td>
        </tr>
      </table>
    </td>
    <td width="50%" height="15" align="left" valign="top"> 
      <table width="100%" border="1" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
        <tr align="center"> 
          <td colspan="3" height="25"><b>其 它 扣 款（元）</b></td>
        </tr>
        <%
	double allkkje=0;
	String qtkkmc=null;
	String qtkbz=null;
	double kkje=0;
	ls_sql="select qtkkmc,kkje,bz";
	ls_sql+=" from  cw_kqtkjl,dm_qtkkbm";
	ls_sql+=" where cw_kqtkjl.qtkkbm=dm_qtkkbm.qtkkbm(+) and cw_kqtkjl.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		qtkkmc=cf.fillNull(rs.getString("qtkkmc"));
		qtkbz=cf.fillNull(rs.getString("bz"));
		kkje=rs.getDouble("kkje");

		allkkje+=kkje;

		%> 
        <tr align="center"> 
          <td width="22%" ><%=qtkkmc%></td>
          <td width="19%"><%=kkje%></td>
          <td width="59%" align="left"><%=qtkbz%></td>
        </tr>
        <%
	}
	rs.close();
	ps.close();


%> 
        <tr> 
          <td colspan="3">其它扣款小计：<%=cf.formatDouble(allkkje)%>元</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>


<%

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
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