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

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
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
double glf=0;
double sfke=0;
double zjxssk=0;
double hbqye=0;

double yfgckze=0;
double gckzc=0;
double zjxje=0;
double zhzjxje=0;
double kglf=0;
double kqtk=0;
double zkl=0;
double gckk=0;
double suijin=0;
double suijinbfb=0;
double zjxsuijin=0;
double guanlif=0;
double zjxguanlif=0;

String sgbz=null;
String sjsdh=null;
String bzdh=null;
String zjdh=null;
String sjfkzc=null;
String zjxwcbz=null;
String gcjdmc=null;
String gckkspbz=null;
String fkcsmc=null;
String ztmc=null;

String cxhdbm=null;
String sffj=null;
double fjje=0;
double gsfje=0;
String sfyrz=null;
String rzsc=null;
String sfyyh=null;
String yhyy=null;
double scfjk=0;
double jxglf=0;
double rzf=0;

double getsfke=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String fkxh="";
try {
	conn=cf.getConnection();
	ls_sql="select DECODE(zt,'2','家装客户','3','退单客户','4','非家装客户','5','设计客户') ztmc,zjxssk,guanlif,zjxguanlif,suijin,suijinbfb,zjxsuijin,cxhdbm,sffj,fjje,gsfje,sfyrz,rzsc,sfyyh,yhyy,fkcsmc,kqtk,kglf,gckkspbz,gcjdmc,zjxwcbz,gckk,zkl,sjfkzc,fgsbh,sjsbh,khxm,fwdz,lxfs,xb,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,qye,sjf,glf,sfke,zjxje,zhzjxje,sgbz,jgrq";
	ls_sql+=" from  crm_khxx,dm_gcjdbm,cw_fkcs";
	ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and khbh='"+khbh+"' and crm_khxx.jzkfkcs=cw_fkcs.fkcs(+)";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ztmc=cf.fillNull(rs.getString("ztmc"));
		zjxssk=rs.getDouble("zjxssk");
		suijin=rs.getDouble("suijin");
		suijinbfb=rs.getDouble("suijinbfb");
		zjxsuijin=rs.getDouble("zjxsuijin");
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		sffj=cf.fillNull(rs.getString("sffj"));
		fjje=rs.getDouble("fjje");
		gsfje=rs.getDouble("gsfje");
		sfyrz=cf.fillNull(rs.getString("sfyrz"));
		rzsc=cf.fillNull(rs.getString("rzsc"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhyy=cf.fillNull(rs.getString("yhyy"));

		fkcsmc=cf.fillNull(rs.getString("fkcsmc"));
		kglf=rs.getDouble("kglf");
		kqtk=rs.getDouble("kqtk");
		gckkspbz=cf.fillNull(rs.getString("gckkspbz"));
		gcjdmc=cf.fillNull(rs.getString("gcjdmc"));
		zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));
		gckk=rs.getDouble("gckk");
		zkl=rs.getDouble("zkl");
		sjfkzc=cf.fillNull(rs.getString("sjfkzc"));
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
		glf=rs.getDouble("glf");
		guanlif=rs.getDouble("guanlif");
		zjxguanlif=rs.getDouble("zjxguanlif");

		sfke=rs.getDouble("sfke");
		zjxje=rs.getDouble("zjxje");
		zhzjxje=rs.getDouble("zhzjxje");
		//hbqye=rs.getDouble("hbqye");
	}
	rs.close();
	ps.close();


	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getsfke=rs.getDouble(1);//已收工程款
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
/*
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
*/

	//设计师电话
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
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
	rs =ps.executeQuery();
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//质检电话
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and  sq_dwxx.ssfgs='"+fgsbh+"' and yhmc ='"+zjxm+"' and zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


	//市场返卷款
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='91' and scbz='N'";//91：市场返卷款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		scfjk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//减项管理费
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='94' and scbz='N'";//94：减项管理费
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jxglf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//认证费
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='95' and scbz='N'";//95：认证费
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		rzf=rs.getDouble(1);
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


	if (count>0)
	{
		%>
		<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="8%">收款序号</td>
			<td  width="12%">收款类型</td>
			<td  width="7%">期数</td>
			<td  width="14%" bgcolor="#CCCCCC">收款品牌</td>
			<td  width="12%">实收款金额</td>
			<td  width="6%">收款</td>
			<td  width="6%">支付</td>
			<td  width="12%">转帐款项</td>
			<td  width="14%">转帐品牌</td>
			<td  width="9%">收款时间</td>
		</tr>
		<%
		String getfkxh=null;
		String fklxmc=null;
		String getfkcsmc=null;
		String getgysbh=null;
		double getfkje=0;
		double xjfkje=0;
		double zjfkje=0;
		String skdd=null;
		String zffsmc=null;
		String getzckx=null;
		String getzcgysbh=null;
		String getsksj=null;

		String oldfklxmc="";

		ls_sql="SELECT fkxh,a.fklxmc,fkcsmc,gysbh,cw_khfkjl.fkje,DECODE(skdd,'1','财务','2','非财务') skdd";
		ls_sql+=" ,zffsmc,b.fklxmc zckx,zcgysbh,cw_khfkjl.sksj";
		ls_sql+=" FROM cw_khfkjl,sq_dwxx,cw_fklxbm a,cw_fklxbm b,cw_zffsbm,cw_fkcs  ";
		ls_sql+=" where cw_khfkjl.skdw=sq_dwxx.dwbh ";
		ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm and cw_khfkjl.fklxbm=a.fklxbm(+) and cw_khfkjl.zckx=b.fklxbm(+)";
		ls_sql+=" and cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
		ls_sql+=" and cw_khfkjl.fkcs=cw_fkcs.fkcs(+) ";
		ls_sql+=" order by cw_khfkjl.fklxbm,gysbh,fkxh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getfkxh=rs.getString("fkxh");
			fklxmc=cf.fillHtml(rs.getString("fklxmc"));
			getfkcsmc=cf.fillHtml(rs.getString("fkcsmc"));
			getgysbh=cf.fillHtml(rs.getString("gysbh"));
			getfkje=rs.getDouble("fkje");
			skdd=cf.fillHtml(rs.getString("skdd"));
			zffsmc=cf.fillHtml(rs.getString("zffsmc"));
			getzckx=cf.fillHtml(rs.getString("zckx"));
			getzcgysbh=cf.fillHtml(rs.getString("zcgysbh"));
			getsksj=cf.fillHtml(rs.getDate("sksj"));

			if (!oldfklxmc.equals(fklxmc))
			{
				if (!oldfklxmc.equals(""))
				{
					%>
					<tr bgcolor="#FFFFFF"  align="center">
						<td colspan='2'><B><<%=oldfklxmc%>>小计</B></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td align="right"><B><%=cf.formatDouble(xjfkje)%></B></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<%
				}

				oldfklxmc=fklxmc;
				xjfkje=0;
			}

			xjfkje+=getfkje;
			zjfkje+=getfkje;

			%>
			<tr bgcolor="#FFFFFF"  align="center">
				<td><A target='_blank' HREF="/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh=<%=getfkxh%>"><%=getfkxh%></A></td>
				<td><%=fklxmc%></td>
				<td><%=getfkcsmc%></td>
				<td><%=getgysbh%></td>
				<td align="right"><%=cf.formatDouble(getfkje)%></td>
				<td><%=skdd%></td>
				<td><%=zffsmc%></td>
				<td><%=getzckx%></td>
				<td><%=getzcgysbh%></td>
				<td><%=getsksj%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td colspan='2'><B><<%=fklxmc%>>小计</B></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td align="right"><B><%=cf.formatDouble(xjfkje)%></B></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr bgcolor="#FFFFFF"  align="center">
			<td colspan='4'><B>总 计</B></td>
			<td align="right"><B><%=cf.formatDouble(zjfkje)%></B></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		</table>
		<%
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.println(ls_sql);
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

<table width="100%" style="FONT-SIZE:14" >
  <tr>
    <td width="100%"> 
      <div align="center">[<%=khxm%>]付款计划录入 </div>
<%
	if (getsfke!=sfke)
	{
		out.println("<B><font color='#FF0033'>警告！『已收工程款』与明细不符，已收工程款＝"+sfke+"；明细="+getsfke+"</font></B>");
	}
%>
	</td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform">

          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">客户编号</td>
              <td width="32%"><%=khbh%>（<%=ztmc%>）</td>
              <td width="19%" align="right">合同号</td>
              <td width="31%"><%=hth%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%"> 
                <div align="right">房屋地址</div>
              </td>
              <td width="32%"> <%=fwdz%></td>
              <td width="19%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="31%"><%=khxm%>（<%=lxfs%>）</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></td>
              <td bgcolor="#E8E8FF" align="right" width="19%">设计师</td>
              <td width="31%"> <%=sjs%>（<%=sjsdh%>） </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">施工队（班长）</td>
              <td colspan="2"><%
	cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>（<%=sgbz%><%=bzdh%>）</td>
              <td width="31%">质检：<%=zjxm%>（<%=zjdh%>） </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%"> 
                <div align="right">签约－－合同竣工</div>
              </td>
              <td width="32%">[<%=qyrq%>]－－[<%=jgrq%>]</td>
              <td width="19%"> 
                <div align="right">工程进度</div>
              </td>
              <td width="31%"><%=gcjdmc%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"  align="right"><font color="#FF0000">*</font>收款期数</td>
              <td width="32%" > 
                <select name="fkcs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f_getYfk(insertform);">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cw_fkfamx.fkcs,cw_fkcs.fkcsmc||':'||cw_fkfamx.bqfkbl||'%' from cw_fkcs,cw_fkfamx,cw_khfkfa where cw_fkcs.fkcs=cw_fkfamx.fkcs and cw_fkfamx.fkfabm=cw_khfkfa.fkfabm and cw_khfkfa.khbh='"+khbh+"' order by cw_fkfamx.fkcs","");
%> 
                </select>
              </td>
               <td width="18%"  align="right"><font color="#FF0000">*</font><font color="#0000FF">本期应收款金额</font></td>
              <td width="32%"> 
                <input type="text" name="yfkje" value="" size="20" maxlength="20" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
             
              
              <td width="19%"> 
                <div align="right"><font color="#FF0000">*</font>计划收款时间</div>
              </td>
              <td width="31%" colspan=3> 
                <input type="text" name="sksj" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
           
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">计划描述</td>
              <td colspan="3"> 
                <textarea name="jhms" cols="73" rows="6"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="khbh" value="<%=khbh%>" size="20" >
				<input type="hidden" name="hth" value="<%=hth%>">
                <input type="hidden" name="fkxh" value="<%=fkxh%>" >
                <input type="hidden" name="lrr" value="<%=yhmc%>">
                <input type="hidden" name="lrsj" value="<%=cf.today()%>">
               
                <input type="button" name="bc" value="存盘" onClick="f_do(insertform)">
               
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	cf.ajax(out);//启用AJAX
%>


function changeZckx(FormName) 
{
	if(FormName.fkje.value=="") 
	{
		alert("请输入[收款金额]！");
		FormName.fkje.focus();
		return false;
	}

	if(FormName.zckx.value=="") 
	{
		return;
	}

	if (FormName.zckx.value=='21' || FormName.zckx.value=='22' || FormName.zckx.value=='23' || FormName.zckx.value=='24')
	{
		if(FormName.zcgysbh.value=="") 
		{
			return;
		}
	}

	var actionStr="/cwgl/cwsk/fgck/CheckZkJe.jsp?khbh=<%=khbh%>&zckx="+FormName.zckx.value+"&zcgysbh="+FormName.zcgysbh.value+"&fkje="+FormName.fkje.value;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	ajaxRetStr=ajaxRetStr.substring(14)
	if (ajaxRetStr!="")
	{
		alert(ajaxRetStr);
	}
}


function f_getYfk(FormName)
{
	FormName.yfkje.value="";
	
	var str="InsertCw_khfkjCx.jsp?khbh=<%=khbh%>&fkcs="+FormName.fkcs.value;
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fkxh)=="") {
		alert("请输入[收款序号]！");
		FormName.fkxh.focus();
		return false;
	}

	
	if(	javaTrim(FormName.fkcs)=="") {
		alert("请选择[收款期数]！");
		FormName.fkcs.focus();
		return false;
	}
	if(!(isNumber(FormName.fkcs, "收款期数"))) {
		return false;
	}
	
	


	if(!(isFloat(FormName.yfkje, "应收款金额"))) {
		return false;
	}

	


	
	
	if(	javaTrim(FormName.sksj)=="") {
		alert("请输入[收款时间]！");
		FormName.sksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sksj, "收款时间"))) {
		return false;
	}
	
	

	FormName.target="_blank";
	FormName.action="SaveFkjh.jsp";
	FormName.submit();
	
	return true;
}

function f_new(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="InsertCw_khfkjl.jsp";
	FormName.target="";
	FormName.submit();

	
	return true;
}
//-->
</SCRIPT>
