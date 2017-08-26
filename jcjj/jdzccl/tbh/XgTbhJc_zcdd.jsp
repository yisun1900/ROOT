<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String yhjs=(String)session.getAttribute("yhjs");

String ddbh=null;
String khbh=null;
String clgw=null;
String jkxz=null;
String jkdd=null;
String ddshbz=null;
String kjxsj=null;
String xclbz=null;
String htshsj=null;
String xmzy=null;
String qhtsj=null;
String jhclsj=null;
String bz=null;
double hkze=0;
double zjhze=0;
String ddqrr=null;
String ddqrsj=null;
String cltzr=null;
String tzclsj=null;
String sclr=null;
String sclsj=null;
String tzshr=null;
String tzshsj=null;
String jhshsj=null;
String tzry=null;
String shtzsm=null;
String tztbhsj=null;
String tztbhr=null;
String tbhqk=null;
String jhtbhsj=null;
String tbhtzry=null;
String stbhr=null;
String stbhsj=null;
String sshsj=null;
String sshr=null;
String shqk=null;
String whereddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmdwbh=null;
String dwmc=null;
String cxhdbm=null;
String ztjjgw=null;
String htcxhdje=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;
String zcdlbm=null;
String ppbm=null;

try {
	conn=cf.getConnection();

	ls_sql="select shqk,sshsj,sshr,stbhsj,stbhr,tbhtzry,jhtbhsj,tbhqk,tztbhsj,tztbhr,shtzsm,jhshsj,tzry,ztjjgw,htcxhdje,zcdlbm,ppbm,ddbh,khbh,clgw,jkxz,jkdd,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz,hkze,zjhze,ddqrr,ddqrsj,cltzr,tzclsj,sclr,sclsj,tzshr,tzshsj ";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+whereddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		shqk=cf.fillNull(rs.getString("shqk"));
		sshsj=cf.fillNull(rs.getDate("sshsj"));
		sshr=cf.fillNull(rs.getString("sshr"));
		stbhr=cf.fillNull(rs.getString("stbhr"));
		stbhsj=cf.fillNull(rs.getDate("stbhsj"));
		tbhtzry=cf.fillNull(rs.getString("tbhtzry"));
		jhtbhsj=cf.fillNull(rs.getDate("jhtbhsj"));
		tbhqk=cf.fillNull(rs.getString("tbhqk"));
		tztbhr=cf.fillNull(rs.getString("tztbhr"));
		tztbhsj=cf.fillNull(rs.getDate("tztbhsj"));
		shtzsm=cf.fillNull(rs.getString("shtzsm"));
		jhshsj=cf.fillNull(rs.getDate("jhshsj"));
		tzry=cf.fillNull(rs.getString("tzry"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		htcxhdje=cf.fillNull(rs.getString("htcxhdje"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		clgw=cf.fillNull(rs.getString("clgw"));
		jkxz=cf.fillNull(rs.getString("jkxz"));
		jkdd=cf.fillNull(rs.getString("jkdd"));
		ddshbz=cf.fillNull(rs.getString("ddshbz"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		xclbz=cf.fillNull(rs.getString("xclbz"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		jhclsj=cf.fillNull(rs.getDate("jhclsj"));
		bz=cf.fillNull(rs.getString("bz"));
		hkze=rs.getDouble("hkze");
		zjhze=rs.getDouble("zjhze");
		ddqrr=cf.fillNull(rs.getString("ddqrr"));
		ddqrsj=cf.fillNull(rs.getDate("ddqrsj"));
		cltzr=cf.fillNull(rs.getString("cltzr"));
		tzclsj=cf.fillNull(rs.getDate("tzclsj"));
		sclr=cf.fillNull(rs.getString("sclr"));
		sclsj=cf.fillNull(rs.getDate("sclsj"));
		tzshr=cf.fillNull(rs.getString("tzshr"));
		tzshsj=cf.fillNull(rs.getDate("tzshsj"));
	}
	rs.close();
	ps.close();


	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,ssfgs,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		dmdwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();


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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

if (yhjs.equals("G0"))
{
	sjs="&nbsp;";
	qye="&nbsp;";
}
%>

<html>
<head>
<title>修改退补货</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">修改退补货（订单编号：<%=ddbh%>） </div>

<form method="post" action="" name="editform">
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">计划送货时间</div>
      </td>
      <td width="32%"> <%=jhshsj%> </td>
      <td width="18%"> 
        <div align="right">合同送货时间</div>
      </td>
      <td width="32%"><%=htshsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">送货通知说明</td>
      <td colspan="3"><%=shtzsm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">发送货通知人</div>
      </td>
      <td width="32%"> <%=tzshr%> </td>
      <td width="18%"> 
        <div align="right">发送货通知时间</div>
      </td>
      <td width="32%"> <%=tzshsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">通知人员</td>
      <td width="32%"> <%=tzry%> </td>
      <td width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">实送货人</div>
      </td>
      <td width="32%"> <%=sshr%> </td>
      <td width="18%"> 
        <div align="right">实送货时间</div>
      </td>
      <td width="32%"> <%=sshsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">送货情况</div>
      </td>
      <td colspan="3"><%=shqk%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">退补货通知人员</div>
      </td>
      <td width="32%"> <%=tbhtzry%> </td>
      <td width="18%"> 
        <div align="right">约定退补货时间</div>
      </td>
      <td width="32%"> <%=jhtbhsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">发退补货通知人</div>
      </td>
      <td width="32%"> <%=tztbhr%> </td>
      <td width="18%"> 
        <div align="right">发退补货通知时间</div>
      </td>
      <td width="32%"> <%=tztbhsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">实退补货人</div>
      </td>
      <td width="32%"> 
        <input type="text" name="stbhr" value="<%=stbhr%>" size="20" maxlength="20" >
      </td>
      <td width="18%"> 
        <div align="right">实退补货时间</div>
      </td>
      <td width="32%"> 
        <input type="text" name="stbhsj" value="<%=stbhsj%>" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">退补货情况</div>
      </td>
      <td colspan="3"> 
        <textarea name="tbhqk" rows="3" cols="72"><%=tbhqk%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4">
        <div align="center"> 
          <input type="hidden" name="ddbh" size="20" maxlength="9"  value="<%=ddbh%>" >
          <input type="button"  value="保存" onClick="f_do(editform)" name="button">
          <input type="reset"  value="重输" name="reset">
        </div>
      </td>
    </tr>
  </table>
</form>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right" bgcolor="#CCCCFF"> 
      客户编号    </td>
    <td width="32%" bgcolor="#CCCCFF"> <%=khbh%> </td>
    <td width="18%" align="right" bgcolor="#CCCCFF"> 
      合同号    </td>
    <td width="32%" bgcolor="#CCCCFF"><%=hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right">客户姓名</td>
    <td ><%=khxm%>（
      <input type="button" value="查看电话" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" name="button4" >
）</td>
    <td align="right">质检</td>
    <td ><%=zjxm%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right">房屋地址</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr> 
    <td bgcolor="#CCCCFF" align="right">签约店面</td>
    <td bgcolor="#CCCCFF"><%=dwmc%></td>
    <td bgcolor="#CCCCFF" align="right">家装设计师</td>
    <td bgcolor="#CCCCFF"><%=sjs%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right"> 
      施工队    </td>
    <td > <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"> 
      班长    </td>
    <td ><%=sgbz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right"> 
      家装签约日期    </td>
    <td > <%=qyrq%> </td>
    <td align="right">&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td align="right">合同开工日期</td>
    <td ><%=kgrq%></td>
    <td align="right">合同竣工日期</td>
    <td ><%=jgrq%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">参加促销活动</td>
    <td colspan="3"> <%=cxhdbm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td bgcolor="#FFFFFF" align="right">主材大类</td>
    <td > <%=zcdlbm%> </td>
    <td align="right">品牌</td>
    <td > <%=ppbm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">客户交款性质</td>
    <td ><%
	cf.radioToken(out, "1+未付款&2+全款&3+材料商收余款&4+预付款减出&5+退货款减出",jkxz,true);
%></td>
    <td align="right">交款地点</td>
    <td ><%
	cf.radioToken(out, "1+材料商现场收余款&2+店面收款&3+公司财务收款",jkdd,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right"> 
      驻店家居顾问    </td>
    <td > <%=clgw%> </td>
    <td align="right"> 
      展厅家居顾问    </td>
    <td ><%=ztjjgw%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">项目专员</td>
    <td ><%=xmzy%></td>
    <td align="right">&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">需测量标志</td>
    <td ><%
	cf.selectToken(out,"1+不需测量&2+等待测量通知&3+测量已通知&4+已测量",xclbz,true);
%></td>
    <td align="right">计划测量时间</td>
    <td ><%=jhclsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right"> 
      等待送货通知    </td>
    <td ><%
	cf.selectToken(out,"1+不需待电&2+待电未通知&3+待电已通知",ddshbz,true);
%> </td>
    <td align="right"> 
      合同送货时间    </td>
    <td ><%=htshsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right"> 
      签合同时间    </td>
    <td ><%=qhtsj%> </td>
    <td align="right"> 
      可减项截止时间    </td>
    <td ><%=kjxsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">订单确认人</td>
    <td ><%=ddqrr%></td>
    <td align="right">订单确认时间</td>
    <td ><%=ddqrsj%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td align="right" bgcolor="#CCFFCC"> 
      测量通知人    </td>
    <td > <%=cltzr%></td>
    <td align="right"> 
      通知测量时间    </td>
    <td ><%=tzclsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">备注</td>
    <td colspan="3"><%=bz%></td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">类型</td>
	<td  width="12%">主材名称</td>
	<td  width="13%">系列</td>
	<td  width="10%">型号</td>
	<td  width="10%">规格</td>
	<td  width="6%" bgcolor="#CC99FF">铺装位置</td>
	<td  width="6%" bgcolor="#CC99FF">颜色</td>
	<td  width="5%">单位</td>
	<td  width="5%">单价</td>
	<td  width="6%">合同数量</td>
	<td  width="6%" bgcolor="#CC99FF">增减后数量</td>
	<td  width="5%">配件数</td>
	<td  width="11%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql ="SELECT DECODE(jc_zcddmx.lx,'1','合同项','2','增项') lx,zcmc,zclbbm,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm";
	ls_sql+=" ,jc_zcddmx.zcysbm,jc_zcddmx.jldwbm,TO_CHAR(jc_zcddmx.dj),jc_zcddmx.sl,zjhsl";
	ls_sql+=" ,jc_zcddmx.pjts*jc_zcddmx.zjhsl pjzs,jc_zcddmx.bz  ";
	ls_sql+=" FROM jc_zcddmx";
    ls_sql+=" where jc_zcddmx.ddbh='"+ddbh+"' ";
    ls_sql+=" order by jc_zcddmx.lx,jc_zcddmx.zcdlbm,jc_zcddmx.zclbbm,jc_zcddmx.zcbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("lx","1");//列参数对象加入Hash表
	spanColHash.put("zcmc","1");//列参数对象加入Hash表
	spanColHash.put("gysmc","1");//列参数对象加入Hash表
	spanColHash.put("zclbbm","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}

	if(	javaTrim(FormName.stbhr)=="") {
		alert("请选择[实退补货人]！");
		FormName.stbhr.focus();
		return false;
	}
	if(	javaTrim(FormName.stbhsj)=="") {
		alert("请选择[实退补货时间]！");
		FormName.stbhsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.stbhsj, "实退补货时间"))) {
		return false;
	}


	FormName.action="SaveXgTbhJc_zcdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>

