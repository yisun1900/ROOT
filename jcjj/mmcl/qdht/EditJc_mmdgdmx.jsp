<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>修改数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%

String yddbh=null;
String mmdglxbm=null;
String mlx=null;
String mmxh=null;
String sl=null;
String ysbm=null;
String czbm=null;
String azwzbm=null;
String kqfxbm=null;
String dbh=null;
String qh=null;
String mdk=null;
String mdg=null;
String ctbs=null;
String tjx=null;
String dj=null;
String bzdj=null;
String blxhbm=null;
String dczlbm=null;
String sfsmjcc=null;
String sfydc=null;
String dsk=null;
String bz=null;
String mtxbm=null;
String mxxbm=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
String dqbm=null;
String jjfs="";
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select mtxbm,mxxbm,dsk,yddbh,mmdglxbm,mlx,mmxh,sl,ysbm,czbm,azwzbm,kqfxbm,dbh,qh,mdk,mdg,ctbs,tjx,dj,bzdj,blxhbm,bz,dczlbm,sfsmjcc,sfydc ";
	ls_sql+=" from  jc_mmdgdmx";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mtxbm=cf.fillNull(rs.getString("mtxbm"));
		mxxbm=cf.fillNull(rs.getString("mxxbm"));
		dsk=cf.fillNull(rs.getString("dsk"));
		yddbh=cf.fillNull(rs.getString("yddbh"));
		mmdglxbm=cf.fillNull(rs.getString("mmdglxbm"));
		mlx=cf.fillNull(rs.getString("mlx"));
		mmxh=cf.fillNull(rs.getString("mmxh"));
		sl=cf.fillNull(rs.getString("sl"));
		ysbm=cf.fillNull(rs.getString("ysbm"));
		czbm=cf.fillNull(rs.getString("czbm"));
		azwzbm=cf.fillNull(rs.getString("azwzbm"));
		kqfxbm=cf.fillNull(rs.getString("kqfxbm"));
		dbh=cf.fillNull(rs.getString("dbh"));
		qh=cf.fillNull(rs.getString("qh"));
		mdk=cf.fillNull(rs.getString("mdk"));
		mdg=cf.fillNull(rs.getString("mdg"));
		ctbs=cf.fillNull(rs.getString("ctbs"));
		tjx=cf.fillNull(rs.getString("tjx"));
		dj=cf.fillNull(rs.getString("dj"));
		bzdj=cf.fillNull(rs.getString("bzdj"));
		blxhbm=cf.fillNull(rs.getString("blxhbm"));
		bz=cf.fillNull(rs.getString("bz"));
		dczlbm=cf.fillNull(rs.getString("dczlbm"));
		sfsmjcc=cf.fillNull(rs.getString("sfsmjcc"));
		sfydc=cf.fillNull(rs.getString("sfydc"));
	}
	rs.close();
	ps.close();

	ls_sql="select jjfs";
	ls_sql+=" from jc_mmdglx";
	ls_sql+=" where mmdglxbm='"+mmdglxbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jjfs=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm ";
	ls_sql+=" from jc_mmydd,sq_dwxx ";
	ls_sql+=" where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
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
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">修改木门合同明细（<font color="#FF6699">注意：影响到价格部分，[门/窗洞高]包含[地材厚]</font>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_mmdgdmx.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">预订单编号</div>
              </td>
              <td width="28%"> 
                <input type="hidden" name="wherexh"  value="<%=wherexh%>" >
                <input type="text" name="yddbh" value="<%=yddbh%>" size="20" maxlength="9" readonly>
              </td>
              <td width="20%"> 
                <div align="right">订购类型</div>
              </td>
              <td width="30%"> 
                <select name="mmdglxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDglx(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmdglxbm,mmdglxmc from jc_mmdglx order by mmdglxbm",mmdglxbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">门类型</div>
              </td>
              <td width="28%" bgcolor="#FFFFFF"> 
                <select name="mlx" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="tx(mlx);getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mlx,mlxmc||':'||tx from jdm_mlx order by mlx",mlx);
%> 
                </select>
              </td>
              <td width="20%" bgcolor="#FFFFFF"> 
                <div align="right">油色</div>
              </td>
              <td width="30%" bgcolor="#FFFFFF"> 
                <select name="czbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select czbm,czmc  from dm_czbm order by czbm",czbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" bgcolor="#FFCCFF" align="right">木门型号</td>
              <td colspan="3" bgcolor="#FFCCFF"> 
                <select name="mmxh" style="FONT-SIZE:12PX;WIDTH:452PX" onChange="getMmxh(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmxh,trim(mmxh)||'('||mxmc||','||myt||')' from jc_mmxhb,jdm_mxbm,jdm_mytbm where jc_mmxhb.mxbm=jdm_mxbm.mxbm and jc_mmxhb.mytbm=jdm_mytbm.mytbm and jc_mmxhb.dqbm='"+dqbm+"' and (jc_mmxhb.mmxh in(select distinct mmxh from jc_mmbjb where dqbm='"+dqbm+"') OR jc_mmxhb.mmxh='"+mmxh+"') order by mmxh",mmxh);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" bgcolor="#FFCCFF"> 
                <div align="right">材质</div>
              </td>
              <td colspan="3" bgcolor="#FFCCFF"> 
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:452PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
		if (jjfs.equals("11"))//11：木门
		{
			cf.selectItem(out,"select distinct jc_mmbjb.ysbm,mmczmc from  jc_mmbjb,jdm_mmczbm where jc_mmbjb.dqbm='"+dqbm+"' and jc_mmbjb.mmxh='"+mmxh+"' and jc_mmbjb.ysbm=jdm_mmczbm.mmczbm order by mmczmc",ysbm);
		}
		//12：双口哑口；13：双口窗套；14：单口哑口；15：单口窗套
		else if (jjfs.equals("12") || jjfs.equals("13") || jjfs.equals("14") || jjfs.equals("15"))
		{
			cf.selectItem(out,"select distinct jc_mtbjb.ysbm,mmczmc from  jc_mtbjb,jdm_mmczbm where jc_mtbjb.dqbm='"+dqbm+"' and jc_mtbjb.mmdglxbm='"+mmdglxbm+"' and jc_mtbjb.ysbm=jdm_mmczbm.mmczbm order by mmczmc",ysbm);
		}
		//21：门连窗
		else if (jjfs.equals("21"))
		{
			cf.selectItem(out,"select distinct jc_mlcbjb.ysbm,mmczmc from  jc_mlcbjb,jdm_mmczbm where jc_mlcbjb.dqbm='"+dqbm+"' and jc_mlcbjb.mmdglxbm='"+mmdglxbm+"' and jc_mlcbjb.ysbm=jdm_mmczbm.mmczbm  order by mmczmc",ysbm);
		}
		//22：门顶窗
		else if (jjfs.equals("22"))
		{
			cf.selectItem(out,"select distinct jc_mlcbjb.ysbm,mmczmc from  jc_mlcbjb,jdm_mmczbm where jc_mlcbjb.dqbm='"+dqbm+"' and jc_mlcbjb.mmdglxbm='"+mmdglxbm+"' and jc_mlcbjb.ysbm=jdm_mmczbm.mmczbm  order by mmczmc",ysbm);
		}
		//31：外飘窗立口
		else if (jjfs.equals("31"))
		{
			cf.selectItem(out,"select distinct jc_mtbjb.ysbm,mmczmc from  jc_mtbjb,jdm_mmczbm where jc_mtbjb.dqbm='"+dqbm+"' and jc_mtbjb.mmdglxbm='"+mmdglxbm+"' and jc_mtbjb.ysbm=jdm_mmczbm.mmczbm order by mmczmc",ysbm);
		}
		//32：外飘窗平台上口
		else if (jjfs.equals("32"))
		{
			cf.selectItem(out,"select distinct jc_tjxbjb.ysbm,mmczmc from  jc_tjxbjb,jdm_mmczbm where jc_tjxbjb.dqbm='"+dqbm+"' and jc_tjxbjb.mmdglxbm='"+mmdglxbm+"' and jc_tjxbjb.ysbm=jdm_mmczbm.mmczbm order by mmczmc",ysbm);
		}
		//41：平方米计价;42：延米计价
		else if (jjfs.equals("41") || jjfs.equals("42"))
		{
			cf.selectItem(out,"select distinct jc_tjxbjb.ysbm,mmczmc from  jc_tjxbjb,jdm_mmczbm where jc_tjxbjb.dqbm='"+dqbm+"' and jc_tjxbjb.mmdglxbm='"+mmdglxbm+"' and jc_tjxbjb.ysbm=jdm_mmczbm.mmczbm order by mmczmc",ysbm);
		}
		//43：分段平方米计价；44：分段延米计价；45：分段按长度计价
		else if (jjfs.equals("43") || jjfs.equals("44") || jjfs.equals("45"))
		{
			cf.selectItem(out,"select distinct jc_hjbjb.ysbm,mmczmc from jc_hjbjb,jdm_mmczbm where jc_hjbjb.dqbm='"+dqbm+"' and jc_hjbjb.mmdglxbm='"+mmdglxbm+"' and jc_hjbjb.ysbm=jdm_mmczbm.mmczbm  order by mmczmc",ysbm);
		}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">安装位置</div>
              </td>
              <td width="28%"> 
                <select name="azwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select azwzbm,azwzmc from jdm_azwzbm order by azwzbm",azwzbm);
%> 
                </select>
              </td>
              <td width="20%"> 
                <div align="right">开启方向</div>
              </td>
              <td width="30%"> 
                <select name="kqfxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select kqfxbm,kqfxmc from jdm_kqfxbm order by kqfxbm",kqfxbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="22%" align="right">（门,哑口,窗套）门套线</td>
              <td width="28%">
                <select name="mtxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mtxbm,mtxmc from jdm_mtxbm order by mtxbm",mtxbm);
%> 
                </select>
              </td>
              <td width="20%" align="right">（门,哑口,窗套）门芯线</td>
              <td width="30%">
                <select name="mxxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mxxbm,mxxmc from jdm_mxxbm order by mxxbm",mxxbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right">地材种类</td>
              <td width="28%"> 
                <select name="dczlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJg(dczlbm,dbh);getDj(insertform);">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dczlbm,dczlmc||'，厚度:'||dzhd from jdm_dczlbm order by dczlbm",dczlbm);
%> 
                </select>
              </td>
              <td width="20%" align="right">玻璃型号</td>
              <td width="30%"> 
                <select name="blxhbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select blxhbm,blxh from jc_blbj order by blxhbm",blxhbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right" bgcolor="#FFCCFF">门/窗/平台上口/立口墙厚</td>
              <td width="28%" bgcolor="#FFCCFF"> 
                <input type="text" name="qh" value="<%=qh%>" size="14" maxlength="8"  onChange="getDj(insertform)">
                （mm） </td>
              <td width="20%" align="right" bgcolor="#FFFFFF">地材厚</td>
              <td width="30%"> 
                <input type="text" name="dbh" value="<%=dbh%>" size="14" maxlength="8"  onChange="getDj(insertform)" >
                （mm） </td>
            </tr>
            <tr bgcolor="#FFCCFF"> 
              <td width="22%"> 
                <div align="right">门/窗/平台上口/护角宽</div>
              </td>
              <td width="28%"> 
                <input type="text" name="mdk" value="<%=mdk%>" size="14" maxlength="8"  onChange="getDj(insertform)">
                （mm） </td>
              <td width="20%"> 
                <div align="right">门/窗/立口/护角高</div>
              </td>
              <td width="30%" bgcolor="#FFCCFF"> 
                <input type="text" name="mdg" value="<%=mdg%>" size="14" maxlength="8"  onChange="getDj(insertform)">
                （mm） （<b><font color="#0000FF">包含地材厚</font></b>） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right">单双口</td>
              <td width="28%"> <%
		cf.radioToken(out, "dsk","1+单口&2+双口",dsk);
%> </td>
              <td width="20%" align="right">&nbsp;</td>
              <td width="30%">&nbsp; </td>
            </tr>
            <tr> 
              <td width="22%" bgcolor="#FFFFFF" align="right">是否有顶窗</td>
              <td width="28%" bgcolor="#FFFFFF"> <%
		cf.radioToken(out, "sfydc","Y+有顶窗&N+无顶窗",sfydc);
%></td>
              <td width="20%" bgcolor="#FFFFFF" align="right">门套/哑口材质</td>
              <td width="30%" bgcolor="#FFFFFF"> 
                <select name="sfsmjcc" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+松木集成材&N+非松木集成材",sfsmjcc);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">门套/窗套边数</div>
              </td>
              <td width="28%"> 
                <select name="ctbs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"3+三边&4+四边",ctbs);
%> 
                </select>
              </td>
              <td width="20%"> 
                <div align="right">踢脚线/欧式上帽</div>
              </td>
              <td width="30%"> 
                <input type="text" name="tjx" value="<%=tjx%>" size="12" maxlength="8"  onChange="getDj(insertform)">
                延米 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">订购数量</div>
              </td>
              <td width="28%"> 
                <input type="text" name="sl" value="<%=sl%>" size="20" maxlength="8" >
              </td>
              <td width="20%"> 
                <div align="right"><font color="#0000CC">标准单价（元）</font></div>
              </td>
              <td width="30%"> 
                <input type="text" name="dj" value="<%=bzdj%>" size="20" maxlength="9" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="hidden" name="jjfs" value="<%=jjfs%>" >
                <input type="button"  value="存盘" onClick="f_do(insertform)" name="bc">
                <input type="reset"  value="重输" name="reset">
                <input type="button"  value="重新计算价格" onClick="getDj(insertform)">
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
function tx(mlx)//参数FormName:Form的名称
{
	var tx=getSubStr(mlx);
	if (tx!="")
	{
		alert("注意！"+tx);
	}
}

function addItem(f1,text,value)
{
	var op1=document.createElement("OPTION");
	op1.text=text;
	op1.value=value;
	f1.add(op1);
}

function getDglx(FormName)
{
	FormName.mmxh.value="";
	FormName.ysbm.value="";
	FormName.jjfs.value="";

	if (FormName.mmdglxbm.value=='')
	{
		return;
	}


	var str="Jc_mmydmxCx.jsp?getlx=1&dqbm=<%=dqbm%>&mmdglxbm="+FormName.mmdglxbm.value;
//	alert(str);
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function getMmxh(FormName)
{
	if (FormName.mmdglxbm.value=='')
	{
		return;
	}
	if (FormName.mmxh.value=='')
	{
		return;
	}

	FormName.ysbm.value="";

	var str="Jc_mmydmxCx.jsp?getlx=2&dqbm=<%=dqbm%>&mmdglxbm="+FormName.mmdglxbm.value+"&mmxh="+FormName.mmxh.value;
//	alert(str);
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function getDj(FormName)
{
	FormName.dj.value="";

	if (FormName.mmdglxbm.value=='')
	{
		return;
	}
	if (FormName.jjfs.value=='')
	{
		return;
	}

	var getjjfs=FormName.jjfs.value;

	if (getjjfs=='11')//11：木门
	{
		if (FormName.mdk.value=='')
		{
			return;
		}
		if (FormName.mdg.value=='')
		{
			return;
		}
		if (FormName.qh.value=='')
		{
			return;
		}
		if (FormName.dbh.value=='')
		{
			return;
		}
	}
	//12：双口哑口；13：双口窗套；14：单口哑口；15：单口窗套
	else if (getjjfs=="12" || getjjfs=="13" || getjjfs=="14" || getjjfs=="15" )
	{
		if (FormName.mdk.value=='')
		{
			return;
		}
		if (FormName.mdg.value=='')
		{
			return;
		}
		if (FormName.qh.value=='')
		{
			return;
		}
	}
	//21：门连窗;22：门顶窗
	else if (getjjfs=="21" || getjjfs=="22")
	{
		if (FormName.mdk.value=='')
		{
			return;
		}
		if (FormName.mdg.value=='')
		{
			return;
		}
		if (FormName.qh.value=='')
		{
			return;
		}
	}
	//31：外飘窗立口
	else if (getjjfs=="31" )
	{
		if (FormName.mdg.value=='')
		{
			return;
		}
		if (FormName.qh.value=='')
		{
			return;
		}
	}
	//32：外飘窗平台上口
	else if (getjjfs=="32" )
	{
		if (FormName.mdk.value=='')
		{
			return;
		}
		if (FormName.qh.value=='')
		{
			return;
		}
	}
	//41：平方米计价
	else if (getjjfs=="41")
	{
		if (FormName.mdk.value=='')
		{
			return;
		}
		if (FormName.mdg.value=='')
		{
			return;
		}
	}
	//42：延米计价
	else if (getjjfs=="42")
	{
		if (FormName.tjx.value=='')
		{
			return;
		}
	}
	//43：分段平方米计价
	else if (getjjfs=="43")
	{
		if (FormName.mdk.value=='')
		{
			return;
		}
		if (FormName.mdg.value=='')
		{
			return;
		}
		if (FormName.qh.value=='')
		{
			return;
		}
	}
	//44：分段延米计价
	else if (getjjfs=="44")
	{
		if (FormName.qh.value=='')
		{
			return;
		}
		if (FormName.tjx.value=='')
		{
			return;
		}
	}
	//45：分段按长度计价
	else if (getjjfs=="45")
	{
		if (FormName.mdk.value=='')
		{
			return;
		}
		if (FormName.mdg.value=='')
		{
			return;
		}
	}

	//为了防止价格未计算完，点击『存盘』按钮
	FormName.bc.disabled=true;

	var str="Jc_mmydmxCx.jsp?getlx=3&dqbm=<%=dqbm%>&mmdglxbm="+FormName.mmdglxbm.value+"&mlx="+FormName.mlx.value+"&dbh="+FormName.dbh.value;
	str+="&mmxh="+FormName.mmxh.value+"&ysbm="+FormName.ysbm.value+"&ctbs="+FormName.ctbs.value;
	str+="&mdk="+FormName.mdk.value+"&mdg="+FormName.mdg.value+"&qh="+FormName.qh.value+"&tjx="+FormName.tjx.value;
	str+="&sfsmjcc="+FormName.sfsmjcc.value+"&mtxbm="+FormName.mtxbm.value+"&mxxbm="+FormName.mxxbm.value;
//	alert(str);
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.mmdglxbm)=="") {
		alert("请选择[木门订购类型]！");
		FormName.mmdglxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ysbm)=="") {
		alert("请选择[材质]！");
		FormName.ysbm.focus();
		return false;
	}

	if(	javaTrim(FormName.czbm)=="") {
		alert("请输入[油色]！");
		FormName.czbm.focus();
		return false;
	}

	if(	javaTrim(FormName.jjfs)=="") {
		alert("[计价方式]为空，请联系系统管理员！");
		FormName.jjfs.focus();
		return false;
	}

	var getjjfs=FormName.jjfs.value;


	if (getjjfs=='11')//11：木门
	{
		if(	javaTrim(FormName.mlx)=="") {
			alert("请选择[门类型]！");
			FormName.mlx.focus();
			return false;
		}
		if(	javaTrim(FormName.mmxh)=="") {
			alert("请选择[木门型号]！");
			FormName.mmxh.focus();
			return false;
		}
		if(	javaTrim(FormName.azwzbm)=="") {
			alert("请选择[安装位置]！");
			FormName.azwzbm.focus();
			return false;
		}
		if(	javaTrim(FormName.kqfxbm)=="") {
			alert("请选择[开启方向]！");
			FormName.kqfxbm.focus();
			return false;
		}
		if(	javaTrim(FormName.mtxbm)=="") {
			alert("请输入[门套线]！");
			FormName.mtxbm.focus();
			return false;
		}
		if(	javaTrim(FormName.mxxbm)=="") {
			alert("请输入[门芯线]！");
			FormName.mxxbm.focus();
			return false;
		}

		if(	javaTrim(FormName.dczlbm)=="") {
			alert("请输入[地材种类]！");
			FormName.dczlbm.focus();
			return false;
		}
		if(	javaTrim(FormName.dbh)=="") {
			alert("请输入[地板厚]！");
			FormName.dbh.focus();
			return false;
		}
		if(!(isNumber(FormName.dbh, "地材厚"))) {
			return false;
		}

		if(	javaTrim(FormName.qh)=="") {
			alert("请输入[墙厚]！");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "墙厚"))) {
			return false;
		}
		if(	javaTrim(FormName.mdk)=="") {
			alert("请输入[门/窗洞宽]！");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "门/窗洞宽"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("请输入[门/窗洞高]！");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "门/窗洞高"))) {
			return false;
		}
	}
	//12：双口哑口；13：双口窗套；14：单口哑口；15：单口窗套;21：门连窗;22：门顶窗
	else if (getjjfs=="12" || getjjfs=="13" || getjjfs=="14" || getjjfs=="15" || getjjfs=="21" || getjjfs=="22")
	{
		if(	javaTrim(FormName.mtxbm)=="") {
			alert("请输入[门套线]！");
			FormName.mtxbm.focus();
			return false;
		}
		if(	javaTrim(FormName.mxxbm)=="") {
			alert("请输入[门芯线]！");
			FormName.mxxbm.focus();
			return false;
		}
		if(	javaTrim(FormName.qh)=="") {
			alert("请输入[墙厚]！");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "墙厚"))) {
			return false;
		}
		if(	javaTrim(FormName.mdk)=="") {
			alert("请输入[门洞宽]！");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "门洞宽"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("请输入[门洞高]！");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "门洞高"))) {
			return false;
		}
		if(	javaTrim(FormName.ctbs)=="") {
			alert("请输入[门套/窗套边数]！");
			FormName.ctbs.focus();
			return false;
		}
	}
	//31：外飘窗立口
	else if (getjjfs=="31" )
	{
		if(	javaTrim(FormName.qh)=="") {
			alert("请输入[立口墙厚]！");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "立口墙厚"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("请输入[立口高]！");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "立口高"))) {
			return false;
		}
	}
	//32：外飘窗平台上口
	else if (getjjfs=="32" )
	{
		if(	javaTrim(FormName.qh)=="") {
			alert("请输入[平台上口墙厚]！");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "平台上口墙厚"))) {
			return false;
		}
		if(	javaTrim(FormName.mdk)=="") {
			alert("请输入[平台上口宽]！");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "平台上口宽"))) {
			return false;
		}
	}
	//41：平方米计价
	else if (getjjfs=="41")
	{
		if(	javaTrim(FormName.mdk)=="") {
			alert("请输入[门洞宽]！");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "门洞宽"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("请输入[门洞高]！");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "门洞高"))) {
			return false;
		}
	}
	//42：延米计价
	else if (getjjfs=="42")
	{
		if(	javaTrim(FormName.tjx)=="") {
			alert("请输入[踢脚线/欧式上帽]！");
			FormName.tjx.focus();
			return false;
		}
		if(!(isFloat(FormName.tjx, "踢脚线/欧式上帽"))) {
			return false;
		}
	}
	//43：分段平方米计价
	else if (getjjfs=="43")
	{
		if(	javaTrim(FormName.mdk)=="") {
			alert("请输入[门洞宽]！");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "门洞宽"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("请输入[门洞高]！");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "门洞高"))) {
			return false;
		}
		if(	javaTrim(FormName.qh)=="") {
			alert("请输入[墙厚]！");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "墙厚"))) {
			return false;
		}
	}
	//44：分段延米计价
	else if (getjjfs=="44")
	{
		if(	javaTrim(FormName.tjx)=="") {
			alert("请输入[踢脚线/欧式上帽]！");
			FormName.tjx.focus();
			return false;
		}
		if(!(isFloat(FormName.tjx, "踢脚线/欧式上帽"))) {
			return false;
		}
		if(	javaTrim(FormName.qh)=="") {
			alert("请输入[墙厚]！");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "墙厚"))) {
			return false;
		}
	}
	//45：分段按长度计价
	else if (getjjfs=="45")
	{
		if(	javaTrim(FormName.mdk)=="") {
			alert("请输入[宽度]！");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "宽度"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("请输入[高度]！");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "高度"))) {
			return false;
		}
	}

	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[订购数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "订购数量"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="" || FormName.dj.value=="0") {
		alert("[单价]不能为空，可能是价格信息不完整，未查到价格信息！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}
	FormName.submit();
	return true;

}
//-->
</SCRIPT>

