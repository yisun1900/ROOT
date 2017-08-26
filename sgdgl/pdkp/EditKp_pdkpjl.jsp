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

<%

String kpjlh=null;
String fgsbh=null;
String qssj=null;
String jzsj=null;
int kxsgds=0;
double sgdpdze=0;
double ajqz=0;
double bjqz=0;
double cjqz=0;
double djqz=0;
double ajddbl=0;
double ajzdbl=0;
double ajxdbl=0;
double bjddbl=0;
double bjzdbl=0;
double bjxdbl=0;
double cjddbl=0;
double cjzdbl=0;
double cjxdbl=0;
double djddbl=0;
double djzdbl=0;
double djxdbl=0;
double ajzdjde=0;
double bjzdjde=0;
double cjzdjde=0;
double djzdjde=0;
int sgdpkzf=0;
double mfkjde=0;

double zsdpdze=0;
double zsajqz=0;
double zsbjqz=0;
double zscjqz=0;
double zsdjqz=0;
double zsajddbl=0;
double zsajzdbl=0;
double zsajxdbl=0;
double zsbjddbl=0;
double zsbjzdbl=0;
double zsbjxdbl=0;
double zscjddbl=0;
double zscjzdbl=0;
double zscjxdbl=0;
double zsdjddbl=0;
double zsdjzdbl=0;
double zsdjxdbl=0;
double zsajzdjde=0;
double zsbjzdjde=0;
double zscjzdjde=0;
double zsdjzdjde=0;

int zsdkpzf=0;
double zsmfkjde=0;

String lrr=null;
String lrsj=null;
String zxbz=null;
String bz=null;
String wherekpjlh=cf.GB2Uni(request.getParameter("kpjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select kpjlh,fgsbh,qssj,jzsj,kxsgds,sgdpdze,ajqz,bjqz,cjqz,djqz,ajddbl,ajzdbl,ajxdbl,bjddbl,bjzdbl,bjxdbl,cjddbl,cjzdbl,cjxdbl,djddbl,djzdbl,djxdbl,ajzdjde,bjzdjde,cjzdjde,djzdjde,sgdpkzf,mfkjde    ,zsdpdze,zsajqz,zsbjqz,zscjqz,zsdjqz,zsajddbl,zsajzdbl,zsajxdbl,zsbjddbl,zsbjzdbl,zsbjxdbl,zscjddbl,zscjzdbl,zscjxdbl,zsdjddbl,zsdjzdbl,zsdjxdbl,zsajzdjde,zsbjzdjde,zscjzdjde,zsdjzdjde   ,zsdkpzf,zsmfkjde,lrr,lrsj,zxbz,bz ";
	ls_sql+=" from  kp_pdkpjl";
	ls_sql+=" where kpjlh='"+wherekpjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kpjlh=cf.fillNull(rs.getString("kpjlh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		qssj=cf.fillNull(rs.getDate("qssj"));
		jzsj=cf.fillNull(rs.getDate("jzsj"));
		kxsgds=rs.getInt("kxsgds");
		sgdpdze=rs.getDouble("sgdpdze");
		ajqz=rs.getDouble("ajqz");
		bjqz=rs.getDouble("bjqz");
		cjqz=rs.getDouble("cjqz");
		djqz=rs.getDouble("djqz");
		ajddbl=rs.getDouble("ajddbl");
		ajzdbl=rs.getDouble("ajzdbl");
		ajxdbl=rs.getDouble("ajxdbl");
		bjddbl=rs.getDouble("bjddbl");
		bjzdbl=rs.getDouble("bjzdbl");
		bjxdbl=rs.getDouble("bjxdbl");
		cjddbl=rs.getDouble("cjddbl");
		cjzdbl=rs.getDouble("cjzdbl");
		cjxdbl=rs.getDouble("cjxdbl");
		djddbl=rs.getDouble("djddbl");
		djzdbl=rs.getDouble("djzdbl");
		djxdbl=rs.getDouble("djxdbl");
		ajzdjde=rs.getDouble("ajzdjde");
		bjzdjde=rs.getDouble("bjzdjde");
		cjzdjde=rs.getDouble("cjzdjde");
		djzdjde=rs.getDouble("djzdjde");
		sgdpkzf=rs.getInt("sgdpkzf");
		mfkjde=rs.getDouble("mfkjde");

		zsdpdze=rs.getDouble("zsdpdze");
		zsajqz=rs.getDouble("zsajqz");
		zsbjqz=rs.getDouble("zsbjqz");
		zscjqz=rs.getDouble("zscjqz");
		zsdjqz=rs.getDouble("zsdjqz");
		zsajddbl=rs.getDouble("zsajddbl");
		zsajzdbl=rs.getDouble("zsajzdbl");
		zsajxdbl=rs.getDouble("zsajxdbl");
		zsbjddbl=rs.getDouble("zsbjddbl");
		zsbjzdbl=rs.getDouble("zsbjzdbl");
		zsbjxdbl=rs.getDouble("zsbjxdbl");
		zscjddbl=rs.getDouble("zscjddbl");
		zscjzdbl=rs.getDouble("zscjzdbl");
		zscjxdbl=rs.getDouble("zscjxdbl");
		zsdjddbl=rs.getDouble("zsdjddbl");
		zsdjzdbl=rs.getDouble("zsdjzdbl");
		zsdjxdbl=rs.getDouble("zsdjxdbl");
		zsajzdjde=rs.getDouble("zsajzdjde");
		zsbjzdjde=rs.getDouble("zsbjzdjde");
		zscjzdjde=rs.getDouble("zscjzdjde");
		zsdjzdjde=rs.getDouble("zsdjzdjde");

		zsdkpzf=rs.getInt("zsdkpzf");
		zsmfkjde=rs.getDouble("zsmfkjde");
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		zxbz=cf.fillNull(rs.getString("zxbz"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	if (!zxbz.equals("Y"))
	{
		out.println("错误！只能修改最新的考评记录");
		return;
	}
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
  <div align="center">施工队派单考评记录（<font color="#0000CC">考评记录号：<%=kpjlh%></font>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%" bgcolor="#FFFFFF"><font color="#FF0000">*</font>分公司</td>
      <td width="32%"> 
		<input type="hidden" name="kpjlh" value="<%=kpjlh%>" size="20" maxlength="9" readonly>
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
%> 
        </select>
      </td>
      <td align="right" width="21%"><font color="#FF0000">*</font>派单时可选施工队数</td>
      <td width="29%"> 
        <input type="text" name="kxsgds" value="<%=kxsgds%>" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font>考评起始时间</td>
      <td width="32%"> 
		<input type="text" name="qssj" value="<%=qssj%>" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="21%"><font color="#FF0000">*</font>考评截止时间</td>
      <td width="29%"> 
        <input type="text" name="jzsj" value="<%=jzsj%>" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><font color="#FF0000">*</font>非直属队派单总额</td>
      <td width="32%"> 
        <input type="text" name="sgdpdze" value="<%=sgdpdze%>" size="20" maxlength="17" >
        万 </td>
      <td align="right" width="21%"><font color="#FF0000">*</font>直属队派单总额</td>
      <td width="29%"> 
        <input type="text" name="zsdpdze" value="<%=zsdpdze%>" size="20" maxlength="17" >
        万 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
      <td width="32%"> 
		<input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="21%"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
      <td width="29%"> 
        <input type="text" name="lrsj" value="<%=lrsj%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="75" rows="2"><%=bz%></textarea>
      </td>
    </tr>
  </table>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF" align="center"> 
      <td colspan="8" height="21"><b>非直属队</b></td>
    </tr>
    <tr bgcolor="#FFFFFF" align="center"> 
      <td height="26" colspan="2" bgcolor="#E8E8FF"><b>A级队</b></td>
      <td height="26" colspan="2" bgcolor="#FFFFCC"><b>B级队</b></td>
      <td height="26" colspan="2" bgcolor="#E8E8FF"><b>C级队</b></td>
      <td colspan="2" height="26" bgcolor="#FFFFCC"><b>D级队</b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">权重</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="ajqz" value="<%=ajqz%>" size="8" maxlength="9" >
      </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">权重</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="bjqz" value="<%=bjqz%>" size="8" maxlength="9" >
      </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">权重</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="cjqz" value="<%=cjqz%>" size="8" maxlength="9" >
      </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">权重</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="djqz" value="<%=djqz%>" size="8" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">最大接单额</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="ajzdjde" value="<%=ajzdjde%>" size="8" maxlength="17" >
        万 </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">最大接单额</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="bjzdjde" value="<%=bjzdjde%>" size="8" maxlength="17" >
        万 </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">最大接单额</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="cjzdjde" value="<%=cjzdjde%>" size="8" maxlength="17" >
        万 </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">最大接单额</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="djzdjde" value="<%=djzdjde%>" size="8" maxlength="17" >
        万 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">接大单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="ajddbl" value="<%=ajddbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">接大单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="bjddbl" value="<%=bjddbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">接大单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="cjddbl" value="<%=cjddbl%>" size="8" maxlength="9" >
        % </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">接大单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="djddbl" value="<%=djddbl%>" size="8" maxlength="9" >
        % </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">接中单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="ajzdbl" value="<%=ajzdbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">接中单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="bjzdbl" value="<%=bjzdbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">接中单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="cjzdbl" value="<%=cjzdbl%>" size="8" maxlength="9" >
        % </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">接中单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="djzdbl" value="<%=djzdbl%>" size="8" maxlength="9" >
        % </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">接小单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="ajxdbl" value="<%=ajxdbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">接小单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="bjxdbl" value="<%=bjxdbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">接小单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="cjxdbl" value="<%=cjxdbl%>" size="8" maxlength="9" >
        % </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">接小单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="djxdbl" value="<%=djxdbl%>" size="8" maxlength="9" >
        % </td>
    </tr>
  </table>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td height="24" colspan="8" align="center"><b>直属队</b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">权重</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zsajqz" value="<%=zsajqz%>" size="8" maxlength="9" >
      </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">权重</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsbjqz" value="<%=zsbjqz%>" size="8" maxlength="9" >
      </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">权重</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zscjqz" value="<%=zscjqz%>" size="8" maxlength="9" >
      </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">权重</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsdjqz" value="<%=zsdjqz%>" size="8" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">最大接单额</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zsajzdjde" value="<%=zsajzdjde%>" size="8" maxlength="17" >
        万 </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">最大接单额</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsbjzdjde" value="<%=zsbjzdjde%>" size="8" maxlength="17" >
        万 </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">最大接单额</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zscjzdjde" value="<%=zscjzdjde%>" size="8" maxlength="17" >
        万 </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">最大接单额</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsdjzdjde" value="<%=zsdjzdjde%>" size="8" maxlength="17" >
        万 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">接大单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zsajddbl" value="<%=zsajddbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">接大单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsbjddbl" value="<%=zsbjddbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">接大单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zscjddbl" value="<%=zscjddbl%>" size="8" maxlength="9" >
        % </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">接大单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsdjddbl" value="<%=zsdjddbl%>" size="8" maxlength="9" >
        % </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">接中单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zsajzdbl" value="<%=zsajzdbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">接中单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsbjzdbl" value="<%=zsbjzdbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">接中单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zscjzdbl" value="<%=zscjzdbl%>" size="8" maxlength="9" >
        % </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">接中单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsdjzdbl" value="<%=zsdjzdbl%>" size="8" maxlength="9" >
        % </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">接小单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zsajxdbl" value="<%=zsajxdbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">接小单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsbjxdbl" value="<%=zsbjxdbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">接小单比例</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zscjxdbl" value="<%=zscjxdbl%>" size="8" maxlength="9" >
        % </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">接小单比例</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsdjxdbl" value="<%=zsdjxdbl%>" size="8" maxlength="9" >
        % </td>
    </tr>
    <tr> 
      <td colspan="8" align="center"> 
        <input type="button"  value="修改考评参数" onClick="f_do(insertform)">
        <input type="button"  value="计算机考评" onClick="f_kp(insertform)" name="kp" >
        <input type="button"  value="查看考评结果" onClick="f_ckkp(insertform)" name="ck" >
        <input type="reset"  value="重输" name="reset">
      </td>
    </tr>
  </table>

	<BR>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">记录号</td>
	<td  width="11%">分公司</td>
	<td  width="10%">起始时间</td>
	<td  width="10%">截止时间</td>
	<td  width="11%">非直属派单额</td>
	<td  width="11%">直属队派单额</td>
	<td  width="7%">录入人</td>
	<td  width="10%">录入时间</td>
	<td  width="21%">备注</td>
	</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT kpjlh,dwmc,qssj,jzsj,sgdpdze,zsdpdze,lrr,lrsj,kp_pdkpjl.bz  ";
	ls_sql+=" FROM kp_pdkpjl,sq_dwxx  ";
    ls_sql+=" where (kp_pdkpjl.fgsbh=sq_dwxx.dwbh(+))";
	ls_sql+=" and  fgsbh='"+fgsbh+"'";
    ls_sql+=" order by kpjlh desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(400);//设置每页显示记录数


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"xjjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewKp_xjgdjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("xjjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.kpjlh)=="") {
		alert("请输入[考评记录号]！");
		FormName.kpjlh.focus();
		return false;
	}

	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.kxsgds)=="") {
		alert("请输入[派单时可选施工队数]！");
		FormName.kxsgds.focus();
		return false;
	}
	if(!(isNumber(FormName.kxsgds, "派单时可选施工队数"))) {
		return false;
	}
	if(	javaTrim(FormName.qssj)=="") {
		alert("请输入[考评起始时间]！");
		FormName.qssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qssj, "考评起始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jzsj)=="") {
		alert("请输入[考评截止时间]！");
		FormName.jzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jzsj, "考评截止时间"))) {
		return false;
	}

	if(	javaTrim(FormName.sgdpdze)=="") {
		alert("请输入[非直属队派单总额]！");
		FormName.sgdpdze.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdpdze, "非直属队派单总额"))) {
		return false;
	}
	if(	javaTrim(FormName.zsdpdze)=="") {
		alert("请输入[直属队派单总额]！");
		FormName.zsdpdze.focus();
		return false;
	}
	if(!(isFloat(FormName.zsdpdze, "直属队派单总额"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}



	if(	javaTrim(FormName.ajqz)=="") {
		alert("请输入[A级队权重]！");
		FormName.ajqz.focus();
		return false;
	}
	if(!(isFloat(FormName.ajqz, "A级队权重"))) {
		return false;
	}
	if(	javaTrim(FormName.bjqz)=="") {
		alert("请输入[B级队权重]！");
		FormName.bjqz.focus();
		return false;
	}
	if(!(isFloat(FormName.bjqz, "B级队权重"))) {
		return false;
	}
	if(	javaTrim(FormName.cjqz)=="") {
		alert("请输入[C级队权重]！");
		FormName.cjqz.focus();
		return false;
	}
	if(!(isFloat(FormName.cjqz, "C级队权重"))) {
		return false;
	}
	if(	javaTrim(FormName.djqz)=="") {
		alert("请输入[D级队权重]！");
		FormName.djqz.focus();
		return false;
	}
	if(!(isFloat(FormName.djqz, "D级队权重"))) {
		return false;
	}
	if(	javaTrim(FormName.ajddbl)=="") {
		alert("请输入[A级队接大单比例]！");
		FormName.ajddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.ajddbl, "A级队接大单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.ajzdbl)=="") {
		alert("请输入[A级队接中单比例]！");
		FormName.ajzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.ajzdbl, "A级队接中单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.ajxdbl)=="") {
		alert("请输入[A级队接小单比例]！");
		FormName.ajxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.ajxdbl, "A级队接小单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.bjddbl)=="") {
		alert("请输入[B级队接大单比例]！");
		FormName.bjddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bjddbl, "B级队接大单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.bjzdbl)=="") {
		alert("请输入[B级队接中单比例]！");
		FormName.bjzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bjzdbl, "B级队接中单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.bjxdbl)=="") {
		alert("请输入[B级队接小单比例]！");
		FormName.bjxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bjxdbl, "B级队接小单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.cjddbl)=="") {
		alert("请输入[C级队接大单比例]！");
		FormName.cjddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.cjddbl, "C级队接大单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.cjzdbl)=="") {
		alert("请输入[C级队接中单比例]！");
		FormName.cjzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.cjzdbl, "C级队接中单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.cjxdbl)=="") {
		alert("请输入[C级队接小单比例]！");
		FormName.cjxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.cjxdbl, "C级队接小单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.djddbl)=="") {
		alert("请输入[D级队接大单比例]！");
		FormName.djddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.djddbl, "D级队接大单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.djzdbl)=="") {
		alert("请输入[D级队接中单比例]！");
		FormName.djzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.djzdbl, "D级队接中单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.djxdbl)=="") {
		alert("请输入[D级队接小单比例]！");
		FormName.djxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.djxdbl, "D级队接小单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.ajzdjde)=="") {
		alert("请输入[A级队单组最大接单额]！");
		FormName.ajzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.ajzdjde, "A级队单组最大接单额"))) {
		return false;
	}
	if(	javaTrim(FormName.bjzdjde)=="") {
		alert("请输入[B级队单组最大接单额]！");
		FormName.bjzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.bjzdjde, "B级队单组最大接单额"))) {
		return false;
	}
	if(	javaTrim(FormName.cjzdjde)=="") {
		alert("请输入[C级队单组最大接单额]！");
		FormName.cjzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.cjzdjde, "C级队单组最大接单额"))) {
		return false;
	}
	if(	javaTrim(FormName.djzdjde)=="") {
		alert("请输入[D级队单组最大接单额]！");
		FormName.djzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.djzdjde, "D级队单组最大接单额"))) {
		return false;
	}



	if(	javaTrim(FormName.zsajqz)=="") {
		alert("请输入[直属A级队权重]！");
		FormName.zsajqz.focus();
		return false;
	}
	if(!(isFloat(FormName.zsajqz, "直属A级队权重"))) {
		return false;
	}
	if(	javaTrim(FormName.zsbjqz)=="") {
		alert("请输入[直属B级队权重]！");
		FormName.zsbjqz.focus();
		return false;
	}
	if(!(isFloat(FormName.zsbjqz, "直属B级队权重"))) {
		return false;
	}
	if(	javaTrim(FormName.zscjqz)=="") {
		alert("请输入[直属C级队权重]！");
		FormName.zscjqz.focus();
		return false;
	}
	if(!(isFloat(FormName.zscjqz, "直属C级队权重"))) {
		return false;
	}
	if(	javaTrim(FormName.zsdjqz)=="") {
		alert("请输入[直属D级队权重]！");
		FormName.zsdjqz.focus();
		return false;
	}
	if(!(isFloat(FormName.zsdjqz, "直属D级队权重"))) {
		return false;
	}
	if(	javaTrim(FormName.zsajddbl)=="") {
		alert("请输入[直属A级队接大单比例]！");
		FormName.zsajddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsajddbl, "直属A级队接大单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zsajzdbl)=="") {
		alert("请输入[直属A级队接中单比例]！");
		FormName.zsajzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsajzdbl, "直属A级队接中单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zsajxdbl)=="") {
		alert("请输入[直属A级队接小单比例]！");
		FormName.zsajxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsajxdbl, "直属A级队接小单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zsbjddbl)=="") {
		alert("请输入[直属B级队接大单比例]！");
		FormName.zsbjddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsbjddbl, "直属B级队接大单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zsbjzdbl)=="") {
		alert("请输入[直属B级队接中单比例]！");
		FormName.zsbjzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsbjzdbl, "直属B级队接中单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zsbjxdbl)=="") {
		alert("请输入[直属B级队接小单比例]！");
		FormName.zsbjxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsbjxdbl, "直属B级队接小单比例"))) {
		return false;
	}


	if(	javaTrim(FormName.zscjddbl)=="") {
		alert("请输入[直属C级队接大单比例]！");
		FormName.zscjddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zscjddbl, "直属C级队接大单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zscjzdbl)=="") {
		alert("请输入[直属C级队接中单比例]！");
		FormName.zscjzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zscjzdbl, "直属C级队接中单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zscjxdbl)=="") {
		alert("请输入[直属C级队接小单比例]！");
		FormName.zscjxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zscjxdbl, "直属C级队接小单比例"))) {
		return false;
	}

	if(	javaTrim(FormName.zsdjddbl)=="") {
		alert("请输入[直属D级队接大单比例]！");
		FormName.zsdjddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsdjddbl, "直属D级队接大单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zsdjzdbl)=="") {
		alert("请输入[直属D级队接中单比例]！");
		FormName.zsdjzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsdjzdbl, "直属D级队接中单比例"))) {
		return false;
	}
	if(	javaTrim(FormName.zsdjxdbl)=="") {
		alert("请输入[直属D级队接小单比例]！");
		FormName.zsdjxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsdjxdbl, "直属D级队接小单比例"))) {
		return false;
	}

	if(	javaTrim(FormName.zsajzdjde)=="") {
		alert("请输入[直属A级队单组最大接单额]！");
		FormName.zsajzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.zsajzdjde, "直属A级队单组最大接单额"))) {
		return false;
	}
	if(	javaTrim(FormName.zsbjzdjde)=="") {
		alert("请输入[直属B级队单组最大接单额]！");
		FormName.zsbjzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.zsbjzdjde, "直属B级队单组最大接单额"))) {
		return false;
	}
	if(	javaTrim(FormName.zscjzdjde)=="") {
		alert("请输入[直属C级队单组最大接单额]！");
		FormName.zscjzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.zscjzdjde, "直属C级队单组最大接单额"))) {
		return false;
	}
	if(	javaTrim(FormName.zsdjzdjde)=="") {
		alert("请输入[直属D级队单组最大接单额]！");
		FormName.zsdjzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.zsdjzdjde, "直属D级队单组最大接单额"))) {
		return false;
	}


	FormName.action="SaveEditKp_pdkpjl.jsp";
	FormName.submit();
	return true;
}

function f_kp(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.kpjlh)=="") {
		alert("请输入[考评记录号]！");
		FormName.kpjlh.focus();
		return false;
	}

	if(	javaTrim(FormName.qssj)=="") {
		alert("请输入[考评起始时间]！");
		FormName.qssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qssj, "考评起始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jzsj)=="") {
		alert("请输入[考评截止时间]！");
		FormName.jzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jzsj, "考评截止时间"))) {
		return false;
	}

	FormName.action="tjkpjg.jsp";
	FormName.submit();
	return true;
}
function f_ckkp(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.kpjlh)=="") {
		alert("请输入[考评记录号]！");
		FormName.kpjlh.focus();
		return false;
	}

	FormName.action="ViewKp_pdkpmx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
