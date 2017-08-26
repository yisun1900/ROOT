<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<%
String lrdw=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String khbh=request.getParameter("khbh");

int count=0;

String khxm=null;
String fwdz=null;
String lxfs=null;
String xb=null;
String sjs=null;
String hth=null;
String qyrq=null;
String jgrq=null;
String dwbh=null;
String sjsbh=null;
String fgsbh=null;
String sgd=null;
String zjxm=null;
double wdzgce=0;
double qye=0;
double sjf=0;
double zcbjje=0;
double sfke=0;

double yfgckze=0;
double gckzc=0;
double zjxje=0;
double zhzjxje=0;

int fkcs=0;
double yfkbl=0;

String ssfgs=null;
String sgbz=null;
String sjsdh=null;
String bzdh=null;
String zjdh=null;
String sfzhm=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String fklxbm="";
String fkxh="";
double yfkcj=0;
double yfk=0;

String fkcsmc=null;
String zjxwcbz=null;
double zkl=0;
String gckk=null;

try {
	conn=cf.getConnection();
	ls_sql="select sfzhm,zhzjxje,zjxwcbz,zkl,fkcsmc,fgsbh,sjsbh,khxm,fwdz,lxfs,xb,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,qye,sjf,zcbjje,sfke,zjxje,sgbz,jgrq,gckk";
	ls_sql+=" from  crm_khxx,cw_fkcs";
	ls_sql+=" where khbh='"+khbh+"' and crm_khxx.jzkfkcs=cw_fkcs.fkcs(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfzhm=cf.fillNull(rs.getString("sfzhm"));
		zhzjxje=rs.getDouble("zhzjxje");
		fkcsmc=cf.fillNull(rs.getString("fkcsmc"));
		zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));
		zkl=rs.getDouble("zkl");

		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		xb=cf.fillNull(rs.getString("xb"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));

		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		sjf=rs.getDouble("sjf");
		zcbjje=rs.getDouble("zcbjje");

		sfke=rs.getDouble("sfke");
		zjxje=rs.getDouble("zjxje");
		gckk=cf.fillNull(rs.getString("gckk"));
	}
	rs.close();
	ps.close();

	if (fgsbh.equals(""))
	{
		out.println("错误！所属分公司为空");
		return;
	}
	if (dwbh.equals(""))
	{
		out.println("错误！所属店面为空");
		return;
	}
	if (sjsbh.equals(""))
	{
//		out.println("错误！所属设计室为空");
//		return;
	}
	if (sjs.equals(""))
	{
//		out.println("错误！设计师为空");
//		return;
	}

	//设计师电话
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	//班长电话
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select ssfgs from sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	//质检电话
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and  sq_dwxx.ssfgs='"+ssfgs+"' and yhmc ='"+zjxm+"' and zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


	ls_sql="select count(*)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='11'  and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fkcs=rs.getInt(1);
	}
	rs.close();
	ps.close();
	fkcs++;

	ls_sql="select sum(yfkbl)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='11'  and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yfkbl=rs.getInt(1);
	}
	rs.close();
	ps.close();


	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm not in('11','92') and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yfk=rs.getDouble(1);//已收转出款
	}
	rs.close();
	ps.close();

	ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	fkxh=khbh+cf.addZero(count+1,3);


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

%>

<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 设计费结算申请</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCw_sjfjssqb.jsp" name="insertform" target="_blank">
          <div align="center"></div>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">客户编号</td>
              <td width="32%"><%=khbh%></td>
              <td width="18%" align="right">合同号</td>
              <td width="32%"><%=hth%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="32%"> <%=khxm%>（<%=lxfs%>） </td>
              <td width="18%" bgcolor="#CCFFFF"> 
                <div align="right">身份证号码</div>
              </td>
              <td width="32%" bgcolor="#CCFFFF"><%=sfzhm%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">房屋地址</td>
              <td width="32%"><%=fwdz%></td>
              <td width="18%" align="right">质检姓名</td>
              <td width="32%"><%=zjxm%>（<%=zjdh%>） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td width="18%"> 
                <div align="right">设计师</div>
              </td>
              <td width="32%"><%=sjs%>（<%=sjsdh%>） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">所属分公司</td>
              <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,true);
%></td>
              <td align="right" width="18%">所属设计室</td>
              <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sjsbh+"'",sjsbh,true);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">施工队</td>
              <td width="32%"><%
	cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
              <td width="18%" align="right">班长</td>
              <td width="32%"><%=sgbz%>（<%=bzdh%>）</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">签约日期</div>
              </td>
              <td width="32%"><%=qyrq%> </td>
              <td width="18%"> 
                <div align="right">合同竣工日期</div>
              </td>
              <td width="32%"><%=jgrq%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">折扣率</td>
              <td width="32%" bgcolor="#E8E8FF"><%=zkl%></td>
              <td align="right" bgcolor="#E8E8FF" width="18%"><b><font color="#FF0000">主材费</font></b></td>
              <td bgcolor="#E8E8FF" width="32%"><b><font color="#FF0000"><%=zcbjje%>￥</font></b></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"><b><font color="#FF0000">预算金额</font></b></td>
              <td width="32%"><b><font color="#FF0000"><%=wdzgce%>￥</font></b></td>
              <td width="18%" align="right"><font color="#0000FF">合同金额</font></td>
              <td width="32%" bgcolor="#E8E8FF"><%=qye%>￥</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="18%"><font color="#0000FF">折前累计增减项总额</font></td>
              <td width="32%"><%=cf.formatDouble(zjxje)%>￥</td>
              <td align="right" bgcolor="#E8E8FF" width="18%"><font color="#0000FF">折后累计增减项总额</font></td>
              <td bgcolor="#E8E8FF" width="32%"><%=cf.formatDouble(zhzjxje)%>￥ 
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="18%"><font color="#0000FF">折前累计预算总额</font></td>
              <td width="32%"><font color="#0000FF"><%=cf.formatDouble(wdzgce+zjxje)%></font>￥</td>
              <td align="right" bgcolor="#E8E8FF" width="18%"><font color="#0000FF">折后累计合同金额</font></td>
              <td bgcolor="#E8E8FF" width="32%"><font color="#0000FF"><%=cf.formatDouble(qye+zhzjxje)%></font>￥</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"><b><font color="#FF0000">设计费</font></b></td>
              <td width="32%"><b><font color="#FF0000"><%=sjf%></font></b></td>
              <td width="18%" align="right" bgcolor="#E8E8FF"><b><font color="#FF0000"></font></b></td>
              <td width="32%"><b><font color="#FF0000"></font></b></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"><font color="#0000FF">已收工程款</font></td>
              <td width="32%"><font color="#0000FF"><%=cf.formatDouble(sfke)%>￥</font> 
              </td>
              <td width="18%" align="right" bgcolor="#CCFFFF">转出款可用总金额</td>
              <td width="32%" bgcolor="#CCFFFF"><%=(yfk-yfkcj)%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" height="2" align="right"><font color="#0000FF"><font color="#0000FF">折前应收工程余款</font></font></td>
              <td width="32%" height="2"><font color="#0000FF"><font color="#0000FF"><%=cf.formatDouble(wdzgce+zjxje-sfke)%>￥</font></font> 
              </td>
              <td width="18%" height="2" align="right"><font color="#0000FF"><font color="#0000FF">折后<font color="#0000FF">应收工程余款</font></font></font></td>
              <td width="32%" height="2"><font color="#0000FF"><font color="#0000FF"><%=cf.formatDouble(qye+zhzjxje-sfke)%>￥</font></font> 
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" height="2" align="right">增减项完成标志</td>
              <td width="32%" height="2"><%
	cf.radioToken(out, "zjxwcbz","1+未完成&2+已完成",zjxwcbz,true);
%></td>
              <td width="18%" height="2" align="right">家装收款期数</td>
              <td width="32%" height="2"><%=fkcsmc%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">申请人</td>
              <td width="32%"> 
                <input type="text" name="sqr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
              <td align="right" width="18%">申请时间</td>
              <td width="32%"> 
                <input type="text" name="sqsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="khbh" value="<%=khbh%>">
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
              </td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sqr)=="") {
		alert("请输入[申请人]！");
		FormName.sqr.focus();
		return false;
	}
	if(	javaTrim(FormName.sqsj)=="") {
		alert("请输入[申请时间]！");
		FormName.sqsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqsj, "申请时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
