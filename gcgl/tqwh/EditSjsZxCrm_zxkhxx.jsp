<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String dqbm=(String)session.getAttribute("dqbm");
String yhdlm=(String)session.getAttribute("yhdlm");

String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String fwlxbm=null;
String hxbm=null;
String fwmj=null;
String fgyqbm=null;
String zxysbm=null;
String zxdm=null;
String sfxhf=null;
String hfrq=null;
String hdbz=null;
String khlxbm=null;
String bz=null;

String cqbm=null;
String cgdz=null;
String hdr=null;
String zxzt=null;
String zxdjbm=null;

String lrr=null;
String dwbh=null;
String zxsj=null;
String lrsj=null;
String zxjg=null;
String sbyybm=null;

String sjs="";
String zxqk="";
String newzxjlh=null;
String bjjb=null;
String lfsj=null;
String ctbz=null;
String ctsj=null;
String lfbz=null;
String jzbz=null;
String xqbm=null;
String louhao=null;
String sfzdzbj=null;

String nlqjbm=null;
String zybm=null;
String fj=null;
String yjzxsj=null;
String ywy=null;
String ssfgs=null;
String rddqbm=null;
String hxwzbm=null;
String ysrbm=null;

String xfwdz=null;
String email=null;
String czrkbm=null;
String jtjgbm=null;
String lcbm=null;
String cxbm=null;
String cgbm=null;
String scqxbm=null;
int zxzc=0;
int hqpszc=0;
int jjzczc=0;
int jdzj=0;
String cxhdbm=null;
String fjfwbm=null;
String fwytbm=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();


	ls_sql="select fwytbm,fjfwbm,cxhdbm,zxjlh,xfwdz,email,czrkbm,jtjgbm,lcbm,cxbm,cgbm,scqxbm,zxzc,hqpszc,jjzczc,jdzj,nlqjbm,zybm,fj,yjzxsj,ywy,ssfgs,rddqbm,hxwzbm,ysrbm  ,sfzdzbj,louhao,xqbm,jzbz,lfsj,ctsj,lfbz,ctbz,bjjb,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','飞单审核未通过','3','已签约','4','飞单','5','飞单审核未通过') zxzt,zxdjbm,khxm,xb,fwdz,lxfs,fwlxbm,hxbm,fwmj,fgyqbm,zxysbm,zxdm,sbyybm,sfxhf,hfrq,hdbz,khlxbm,bz,cqbm,cgdz,hdr";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		fwytbm=cf.fillNull(rs.getString("fwytbm"));
		fjfwbm=cf.fillNull(rs.getString("fjfwbm"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		newzxjlh=cf.fillNull(rs.getString("zxjlh"));
		xfwdz=cf.fillNull(rs.getString("xfwdz"));
		email=cf.fillNull(rs.getString("email"));
		czrkbm=cf.fillNull(rs.getString("czrkbm"));
		jtjgbm=cf.fillNull(rs.getString("jtjgbm"));
		lcbm=cf.fillNull(rs.getString("lcbm"));
		cxbm=cf.fillNull(rs.getString("cxbm"));
		cgbm=cf.fillNull(rs.getString("cgbm"));
		scqxbm=cf.fillNull(rs.getString("scqxbm"));
		zxzc=rs.getInt("zxzc");
		hqpszc=rs.getInt("hqpszc");
		jjzczc=rs.getInt("jjzczc");
		jdzj=rs.getInt("jdzj");

		nlqjbm=cf.fillNull(rs.getString("nlqjbm"));
		zybm=cf.fillNull(rs.getString("zybm"));
		fj=cf.fillNull(rs.getString("fj"));
		yjzxsj=cf.fillNull(rs.getDate("yjzxsj"));
		ywy=cf.fillNull(rs.getString("ywy"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		rddqbm=cf.fillNull(rs.getString("rddqbm"));
		hxwzbm=cf.fillNull(rs.getString("hxwzbm"));
		ysrbm=cf.fillNull(rs.getString("ysrbm"));

		sfzdzbj=cf.fillNull(rs.getString("sfzdzbj"));
		louhao=cf.fillNull(rs.getString("louhao"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		lfsj=cf.fillNull(rs.getDate("lfsj"));
		ctsj=cf.fillNull(rs.getDate("ctsj"));
		lfbz=rs.getString("lfbz");
		ctbz=rs.getString("ctbz");
		bjjb=rs.getString("bjjb");

		zxzt=cf.fillNull(rs.getString("zxzt"));
		zxdjbm=cf.fillNull(rs.getString("zxdjbm"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwlxbm=cf.fillNull(rs.getString("fwlxbm"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		fgyqbm=cf.fillNull(rs.getString("fgyqbm"));
		zxysbm=cf.fillNull(rs.getString("zxysbm"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		sbyybm=cf.fillNull(rs.getString("sbyybm"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfrq=cf.fillNull(rs.getDate("hfrq"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		bz=cf.fillNull(rs.getString("bz"));

		cqbm=cf.fillNull(rs.getString("cqbm"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
	}
	rs.close();

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
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>设计师咨询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

        <form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF" align="center"> 
              <td colspan="4" height="25">重做电子报价</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="31%"> 
                <input type="text" name="khxm" size="20" maxlength="50"  value="<%=khxm%>" >
              </td>
              <td width="18%"> 
                <div align="right">性别</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "xb","M+男&W+女",xb);
%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">联系方式</td>
              <td width="31%"> 
                <input type="text" name="lxfs" size="20" maxlength="50"  value="<%=lxfs%>" >
              </td>
              <td width="18%" align="right">E-mail</td>
              <td width="32%"> 
                <input type="text" name="email" size="20" maxlength="50"  value="<%=email%>" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">年龄区间</td>
              <td width="31%"> 
                <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm);
%> 
                </select>
              </td>
              <td width="18%" align="right">职业</td>
              <td width="32%"> 
                <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",zybm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">常住人口</td>
              <td width="31%"> 
                <select name="czrkbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select czrkbm,czrkmc from dm_czrkbm order by czrkbm",czrkbm);
%> 
                </select>
              </td>
              <td width="18%" align="right">家庭结构</td>
              <td width="32%"> 
                <select name="jtjgbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jtjgbm,jtjgmc from dm_jtjgbm order by jtjgbm",jtjgbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right" height="28">现住地址</td>
              <td colspan="3" height="28"> 
                <input type="text" name="xfwdz" size="73" maxlength="100"  value="<%=xfwdz%>">
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">装修房屋所属城区</td>
              <td width="31%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_fwdz(editform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm",cqbm);
%> 
                </select>
              </td>
              <td width="18%" align="right">装修房屋小区/街道</td>
              <td width="32%"> 
                <input type="text" name="xqbm" value="<%=xqbm%>" size="20" maxlength="50" onChange="cf_fwdz(editform)">
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right" height="2">装修房屋楼号/门牌号</td>
              <td width="31%" height="2"> 
                <input type="text" name="louhao" value="<%=louhao%>" size="20" maxlength="50" onChange="cf_fwdz(editform)">
              </td>
              <td colspan="2" height="2">注意：<font color="#0000FF">装修房屋地址</font>（城区＋小区＋楼号）自动生成，不需录入</td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%"> 
                <div align="right"><font color="#0000FF">装修房屋地址</font></div>
              </td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="73" maxlength="100"  value="<%=fwdz%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">报价级别</td>
              <td width="31%"> 
                <select name="bjjb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (sfzdzbj.equals("Y"))
	{
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where  bjjbbm='"+bjjb+"'",bjjb);
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where  bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"') order by bjjbbm",bjjb);
	}
%> 
                </select>
              </td>
              <td width="18%" align="right">家装标志</td>
              <td width="32%"> <%
		if (sfzdzbj.equals("Y"))
		{
			cf.radioToken(out, "jzbz","1+家装报价&2+公装报价",jzbz,true);
		}
		else{
			cf.radioToken(out, "jzbz","1+家装报价&2+公装报价",jzbz);
		}
%> </td>
            </tr>
            <tr bgcolor="#E8E8D4"> 
              <td width="19%"> 
                <div align="right">房屋类型</div>
              </td>
              <td width="31%"> 
                <select name="fwlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm",fwlxbm);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">预计装修时间</div>
              </td>
              <td width="32%"> 
                <input type="text" name="yjzxsj" value="<%=yjzxsj%>" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#E8E8D4"> 
              <td width="19%" align="right">户型</td>
              <td width="31%"> 
                <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%> 
                </select>
              </td>
              <td width="18%" align="right">套内建筑面积</td>
              <td width="32%"> 
                <input type="text" name="fwmj" size="20" maxlength="8"  value="<%=fwmj%>" >
              </td>
            </tr>
            <tr bgcolor="#E8E8D4"> 
              <td width="19%" align="right">楼层</td>
              <td width="31%"> 
                <select name="lcbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select lcbm,lcmc from dm_lcbm order by lcbm",lcbm);
%> 
                </select>
              </td>
              <td width="18%" align="right">房价</td>
              <td width="32%"> 
                <select name="fjfwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fjfwbm,fjfwmc from dm_fjfwbm order by fjfwbm",fjfwbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8D4"> 
              <td width="19%" align="right">朝向</td>
              <td width="31%"> 
                <select name="cxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cxbm,cxmc from dm_cxbm order by cxbm",cxbm);
%> 
                </select>
              </td>
              <td width="18%" align="right">采光</td>
              <td width="32%"> 
                <select name="cgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cgbm,cgmc from dm_cgbm order by cgbm",cgbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8D4"> 
              <td width="19%"> 
                <div align="right">准备装修风格</div>
              </td>
              <td width="31%"> 
                <select name="fgyqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",fgyqbm);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">色彩取向</div>
              </td>
              <td width="32%"> 
                <select name="scqxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select scqxbm,scqxmc from dm_scqxbm order by scqxbm",scqxbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8D4"> 
              <td width="19%" align="right">房屋用途</td>
              <td width="31%"> 
                <select name="fwytbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fwytbm,fwytmc from dm_fwytbm order by fwytbm",fwytbm);
%> 
                </select>
              </td>
              <td width="18%">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">装修总预算</td>
              <td width="31%" bgcolor="#CCCCFF"> 
                <select name="zxysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm",zxysbm);
%> 
                </select>
              </td>
              <td width="18%" align="right" bgcolor="#CCCCFF">希望参加促销活动</td>
              <td width="32%"> 
                <select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cxhdmc c1,cxhdmc||'(订金：'||dj||'￥)' c2 from jc_cxhd where jsbz='N' and fgsbh='"+ssfgs+"' order by cxhdbm",cxhdbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right" bgcolor="#CCCCFF">装修支出</td>
              <td width="31%"> 
                <input type="text" name="zxzc" size="20" maxlength="16" value="<%=zxzc%>">
              </td>
              <td width="18%" align="right">后期配饰支出</td>
              <td width="32%"> 
                <input type="text" name="hqpszc" size="20" maxlength="16" value="<%=hqpszc%>">
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">家居主材支出</td>
              <td width="31%"> 
                <input type="text" name="jjzczc" size="20" maxlength="16" value="<%=jjzczc%>">
              </td>
              <td width="18%" align="right">机动资金</td>
              <td width="32%"> 
                <input type="text" name="jdzj" size="20" maxlength="16" value="<%=jdzj%>">
              </td>
            </tr>
            <tr> 
              <td colspan="4" > 
                <div align="center"> 
                  <p> 
                    <input type="button"  value="增加房间" onClick="f_lrfj(editform)" >
                    <input type="button"  value="修改房间" onClick="f_xgfj(editform)">
                    <input type="button"  value="导入报价" onClick="f_drmb(editform)" >
                    <input type="button"  value="报价另存为" onClick="f_bcmb(editform)" >
                    <input type="button"  value="打印预览" onClick="f_dybj(editform)">
                    <input type="button"  value="导Excel" onClick="f_excel(editform)" name="button">
				  </p>
                  <p> 
                    <input type="button"  value="选报价项目" onClick="f_xzxm(editform)">
                    <input type="button"  value="调项目顺序" onClick="f_xmpx(editform)">
                    <input type="button"  value="选其它收费" onClick="f_ewlr(editform)">
                    <input type="button"  value="修改其它收费" onClick="f_ewck(editform)">
                    <input type="button"  value="调报价级别" onClick="f_tbjjb(editform)">
                    <input type="hidden" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" readonly>
                    <input type="hidden" name="dwbh"  value="<%=zxdm%>" >
                    <input type="hidden" name="sjs" size="20" maxlength="20"  value="<%=sjs%>" readonly>
                  </p>
                </div>
              </td>
            </tr>
          </table>
        </form>

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function cf_fwdz(FormName)
{  
	FormName.xqbm.value=strTrim(FormName.xqbm.value);
	FormName.louhao.value=strTrim(FormName.louhao.value);
	FormName.fwdz.value=FormName.cqbm.options[FormName.cqbm.selectedIndex].text+FormName.xqbm.value+FormName.louhao.value;
}      

function f_bcmb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/dzbj/zxbjmx/cwmb.jsp";
	}
	else{
		FormName.action="/dzbj/zxbjmx/cwmb.jsp";
	}
	FormName.submit();
	return true;
}
function f_lrfj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/dzbj/zxbjmx/ChooseBj_fjxx.jsp";
	}
	else{
		FormName.action="/dzbj/zxbjmx/ChooseBj_fjxx.jsp";
	}
	FormName.submit();
	return true;
}

function f_xgfj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/dzbj/zxbjmx/EditBj_fjxx.jsp";
	}
	else{
		FormName.action="/dzbj/zxbjmx/EditBj_fjxx.jsp";
	}
	FormName.submit();
	return true;
}

function f_ewlr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/dzbj/zxbjmx/InsertBj_sfxmmx.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="/dzbj/zxbjmx/InsertBj_sfxmmx.jsp?dqbm=<%=dqbm%>";
	}
	FormName.submit();
	return true;
}
function f_ewck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/dzbj/zxbjmx/Bj_sfxmmxList.jsp";
	}
	else{
		FormName.action="/dzbj/zxbjmx/Bj_sfxmmxList.jsp";
	}
	FormName.submit();
	return true;
}

function f_xzxm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/dzbj/zxbjmx/bj_khbjmxMain.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="/dzbj/zxbjmx/bj_khbjmxMain.jsp?dqbm=<%=dqbm%>";
	}

	FormName.submit();
	return true;
}

function f_excel(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/dzbj/zxbjmx/Bj_khbjmxExcelList.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="/dzbj/zxbjmx/Bj_khbjmxExcelList.jsp?dqbm=<%=dqbm%>";
	}
	FormName.submit();
	return true;
}

function f_dybj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/dzbj/zxbjmx/Bj_khbjmxDyList.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="/dzbj/zxbjmx/Bj_khbjmxDyList.jsp?dqbm=<%=dqbm%>";
	}
	FormName.submit();
	return true;
}

function f_drmb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if(	javaTrim(FormName.bjjb)=="") {
		alert("请输入[报价级别]！");
		FormName.bjjb.focus();
		return false;
	}



	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/dzbj/zxbjmx/drmb.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="/dzbj/zxbjmx/drmb.jsp?dqbm=<%=dqbm%>";
	}
	FormName.submit();
	return true;
}

function f_edit(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="EditCrm_zxkhxx.jsp";
	FormName.submit();
	return true;
}

function f_tbjjb(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/dzbj/zxbjmx/EditAllBjjb.jsp";
	}
	else{
		FormName.action="/dzbj/zxbjmx/EditAllBjjb.jsp";
	}

	FormName.submit();
	return true;
}

function f_xmpx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		winOpen("/dzbj/zxbjmx/TzXhBjxmList.jsp?khbh=<%=khbh%>",900,600,'YES',"NO");
	}
	else{
		winOpen("/dzbj/zxbjmx/TzXhBjxmList.jsp?khbh=<%=khbh%>",900,600,'YES',"NO");
	}
}


//-->
</SCRIPT>
