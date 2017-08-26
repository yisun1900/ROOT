<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入验收明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<%

String khbh=request.getParameter("khbh");
String ysjlh=request.getParameter("ysjlh");
String gcysxmbm=request.getParameter("gcysxmbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String zpml="";
String gcysbbh=null;
int yszxsl=0;//验收子项数量
int getyszxsl=0;
int byxsl=0;
int fbyxzxsl=0;
try {
	conn=cf.getConnection();

	ls_sql="select gcysbbh,zpml";
	ls_sql+=" from  crm_heysjl";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcysbbh=cf.fillNull(rs.getString("gcysbbh"));
		zpml=cf.fillNull(rs.getString("zpml"));
	}
	rs.close();
	ps.close();

	String gcysxmmc=null;
	String getysbzsm=null;
	String sfxzjg=null;//是否选择甲供
	String xmlx=null;//项目类型
	ls_sql="select gcysxmmc,yszxsl,byxsl,fbyxzxsl,sfxzjg,xmlx";
	ls_sql+=" from  dm_heysxm";
	ls_sql+=" where gcysbbh='"+gcysbbh+"'";
	ls_sql+=" and gcysxmbm='"+gcysxmbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcysxmmc=cf.fillNull(rs.getString("gcysxmmc"));
		getyszxsl=rs.getInt("yszxsl");
		byxsl=rs.getInt("byxsl");
		fbyxzxsl=rs.getInt("fbyxzxsl");
		sfxzjg=cf.fillNull(rs.getString("sfxzjg"));
		xmlx=cf.fillNull(rs.getString("xmlx"));
	}
	rs.close();
	ps.close();

%>
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">录入验收明细</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF" align="center">
    <td width="18%" align="right"><span class="STYLE1">验收项目编码</span></td>
    <td width="32%" align="left"><%=gcysxmbm%></td>
    <td width="18%" align="right"><span class="STYLE1">验收项目名称</span></td>
    <td width="32%" align="left"><%=gcysxmmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center">
    <td align="right"><span class="STYLE1">验收子项数量</span></td>
    <td align="left"><%=getyszxsl%></td>
    <td align="right">&nbsp;</td>
    <td align="left">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center">
    <td align="right"><span class="STYLE1">必验项数量</span></td>
    <td align="left"><%=byxsl%></td>
    <td align="right"><span class="STYLE1">非必验项最小数量</span></td>
    <td align="left"><%=fbyxzxsl%></td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center">
    <td align="right"><span class="STYLE1">验收标准说明</span></td>
    <td colspan="3" align="left"><%=getysbzsm%></td>
  </tr>
</table>

<form method="post" action="SaveInsertCrm_heysmxb.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF" align="center">
    <td width="5%"><strong>分 项</strong></td>
    <td width="28%"><strong>验收子项名</strong></td>
    <td width="5%"><strong>必验项</strong></td>
    <td width="20%"><strong>验收说明</strong></td>
    <td width="6%"><strong>验收结果</strong></td>
    <td width="31%"><strong>备注</strong></td>
    <%
	if (sfxzjg.equals("Y"))//是否选择甲供  Y：选择；N：否
	{
		%>
		<td width="5%"><strong>施工方</strong></td>
		<%
	}
	%>
    </tr>

<%
	String ys=null;
	String byx=null;
	String byxmc=null;
	String ysbztp=null;
	String ysbzsm=null;
	String xmfl=null;
	String ysjg=null;
	int hbx=0;

	ls_sql="select yszxsl,ys1,byx1,ysbztp1,ysbzsm1,ys2,byx2,ysbztp2,ysbzsm2,ys3,byx3,ysbztp3,ysbzsm3,ys4,byx4,ysbztp4,ysbzsm4,ys5,byx5,ysbztp5,ysbzsm5,ys6,byx6,ysbztp6,ysbzsm6,ys7,byx7,ysbztp7,ysbzsm7,ys8,byx8,ysbztp8,ysbzsm8,ys9,byx9,ysbztp9,ysbzsm9,ys10,byx10,ysbztp10,ysbzsm10,ys11,byx11,ysbztp11,ysbzsm11,ys12,byx12,ysbztp12,ysbzsm12,ys13,byx13,ysbztp13,ysbzsm13,ys14,byx14,ysbztp14,ysbzsm14,ys15,byx15,ysbztp15,ysbzsm15,ys16,byx16,ysbztp16,ysbzsm16,ys17,byx17,ysbztp17,ysbzsm17,ys18,byx18,ysbztp18,ysbzsm18,ys19,byx19,ysbztp19,ysbzsm19,ys20,byx20,ysbztp20,ysbzsm20,ys21,byx21,ysbztp21,ysbzsm21,ys22,byx22,ysbztp22,ysbzsm22,ys23,byx23,ysbztp23,ysbzsm23,ys24,byx24,ysbztp24,ysbzsm24,ys25,byx25,ysbztp25,ysbzsm25,ys26,byx26,ysbztp26,ysbzsm26,ys27,byx27,ysbztp27,ysbzsm27,ys28,byx28,ysbztp28,ysbzsm28,ys29,byx29,ysbztp29,ysbzsm29,ys30,byx30,ysbztp30,ysbzsm30,ys31,byx31,ysbztp31,ysbzsm31,ys32,byx32,ysbztp32,ysbzsm32,ys33,byx33,ysbztp33,ysbzsm33,ys34,byx34,ysbztp34,ysbzsm34,ys35,byx35,ysbztp35,ysbzsm35,ys36,byx36,ysbztp36,ysbzsm36,ys37,byx37,ysbztp37,ysbzsm37,ys38,byx38,ysbztp38,ysbzsm38,ys39,byx39,ysbztp39,ysbzsm39,ys40,byx40,ysbztp40,ysbzsm40,ys41,byx41,ysbztp41,ysbzsm41,ys42,byx42,ysbztp42,ysbzsm42,ys43,byx43,ysbztp43,ysbzsm43,ys44,byx44,ysbztp44,ysbzsm44,ys45,byx45,ysbztp45,ysbzsm45,ys46,byx46,ysbztp46,ysbzsm46,ys47,byx47,ysbztp47,ysbzsm47,ys48,byx48,ysbztp48,ysbzsm48,ys49,byx49,ysbztp49,ysbzsm49,ys50,byx50,ysbztp50,ysbzsm50 ";
	ls_sql+=" ,xmfl1,ysjg1,xmfl2,ysjg2,xmfl3,ysjg3,xmfl4,ysjg4,xmfl5,ysjg5,xmfl6,ysjg6,xmfl7,ysjg7,xmfl8,ysjg8,xmfl9,ysjg9,xmfl11,ysjg11,xmfl12,ysjg12,xmfl13,ysjg13,xmfl14,ysjg14,xmfl15,ysjg15,xmfl16,ysjg16,xmfl17,ysjg17,xmfl18,ysjg18,xmfl19,ysjg19,xmfl10,ysjg10,xmfl20,ysjg20,xmfl21,ysjg21,xmfl22,ysjg22,xmfl23,ysjg23,xmfl24,ysjg24,xmfl25,ysjg25,xmfl26,ysjg26,xmfl27,ysjg27,xmfl28,ysjg28,xmfl29,ysjg29,xmfl30,ysjg30,xmfl31,ysjg31,xmfl32,ysjg32,xmfl33,ysjg33,xmfl34,ysjg34,xmfl35,ysjg35,xmfl36,ysjg36,xmfl37,ysjg37,xmfl38,ysjg38,xmfl39,ysjg39,xmfl40,ysjg40,xmfl41,ysjg41,xmfl42,ysjg42,xmfl43,ysjg43,xmfl44,ysjg44,xmfl45,ysjg45,xmfl46,ysjg46,xmfl47,ysjg47,xmfl48,ysjg48,xmfl49,ysjg49,xmfl50,ysjg50";
	ls_sql+=" ,hbx1,hbx2,hbx3,hbx4,hbx5,hbx6,hbx7,hbx8,hbx9,hbx10,hbx11,hbx12,hbx13,hbx14,hbx15,hbx16,hbx17,hbx18,hbx19,hbx20,hbx21,hbx22,hbx23,hbx24,hbx25,hbx26,hbx27,hbx28,hbx29,hbx30,hbx31,hbx32,hbx33,hbx34,hbx35,hbx36,hbx37,hbx38,hbx39,hbx40,hbx41,hbx42,hbx43,hbx44,hbx45,hbx46,hbx47,hbx48,hbx49,hbx50";
	ls_sql+=" from  dm_heysxmpz";
	ls_sql+=" where gcysxmbm='"+gcysxmbm+"'";
	ls_sql+=" and gcysbbh='"+gcysbbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yszxsl=rs.getInt("yszxsl");


		for (int i=0;i<yszxsl ;i++ )
		{
			ys=cf.fillNull(rs.getString("ys"+(i+1)));
			byx=cf.fillNull(rs.getString("byx"+(i+1)));
			ysbztp=cf.fillNull(rs.getString("ysbztp"+(i+1)));
			ysbzsm=cf.fillNull(rs.getString("ysbzsm"+(i+1)));
			xmfl=cf.fillNull(rs.getString("xmfl"+(i+1)));
			ysjg=cf.fillNull(rs.getString("ysjg"+(i+1)));
			hbx=rs.getInt("hbx"+(i+1));

			ysbzsm=ysbzsm.replace("\r\n","<BR>");



			String bgcolor="";
			if (byx.equals("1"))//0.否 1.必验项
			{
				if (ysjg.equals("1"))//1：选择合格；2：选择是否；3：录入字符；4：录入日期；5：录入数字；9：显示说明
				{
					byxmc="必验项";
					bgcolor="#FFFF66";
				}
				else if (ysjg.equals("2"))//1：选择合格；2：选择是否；3：录入字符；4：录入日期；5：录入数字；9：显示说明
				{
					byxmc="必选项";
					bgcolor="#FFFF66";
				}
				else{
					byxmc="必添";
					bgcolor="#FFFF66";
				}
			}
			else{
				byxmc="否";
				bgcolor="#FFFFFF";
			}

			
			if (ysjg.equals(""))
			{
				ysjg="1";
			}

			if (ysjg.equals("1"))//1：选择合格；2：选择是否；3：录入字符；4：录入日期；5：录入数字；9：显示说明
			{

				%>
				<tr bgcolor="<%=bgcolor%>" align="center">
				  <%
					if (xmfl.equals(""))
					{
						%>
						  <td ><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx>1)
					{
						%>
						  <td rowspan="<%=hbx%>"><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx==1)
					{
						%>
						  <td><%=xmfl%></td>
						<%
					}
				  %>
				  <td align="left"><%=ys%></td>
				  <td ><%=byxmc%>
					<input type="hidden" name="byx<%=(i+1)%>" value="<%=byx%>" >
				  </td>
				  <td align="left"><%=ysbzsm%></td>
				  <td ><%cf.radioToken(out, "ys"+(i+1),"合格+合格<BR>&不合格+整改","合格");%></td>
				  <td ><textarea name="sm<%=(i+1)%>" cols="39" rows="3"></textarea>
					<input type="hidden" name="ysjg<%=(i+1)%>" value="<%=ysjg%>" >
					<input type="button" value="上传照片" onClick="f_sczp(insertform,'<%=ysjlh%>','<%=khbh%>','<%=gcysxmbm%>','<%=cf.addZero(i+1,2)%>','<%=ys%>','<%=zpml%>')">
					<input type="button" onClick="f_ckzp(insertform,'<%=ysjlh%>','<%=cf.addZero(i+1,2)%>')"  value="查看子项照片">
				  </td>
					<%
					if (sfxzjg.equals("Y"))//是否选择甲供  Y：选择；N：否
					{
						%>
						  <td ><%cf.radioToken(out, "sgf"+(i+1),"0+甲供<BR>&1+乙供","1");%></td>
						<%
					}
					else{
						%>
						<input type="hidden" name="sgf<%=(i+1)%>" value="" >
						<%
					}
					%>
				</tr>
				<%
			}
			else if (ysjg.equals("2"))//1：选择合格；2：选择是否；3：录入字符；4：录入日期；5：录入数字；9：显示说明
			{
				%>
				<tr bgcolor="<%=bgcolor%>" align="center">
				  <%
					if (xmfl.equals(""))
					{
						%>
						  <td ><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx>1)
					{
						%>
						  <td rowspan="<%=hbx%>"><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx==1)
					{
						%>
						  <td><%=xmfl%></td>
						<%
					}
				  %>
				  <td align="left"><%=ys%></td>
				  <td ><%=byxmc%>
					<input type="hidden" name="byx<%=(i+1)%>" value="<%=byx%>" >
				  </td>
				  <td align="left"><%=ysbzsm%></td>
				  <td ><%cf.radioToken(out, "ys"+(i+1),"是+是<BR>&否+否","否");%></td>
				  <td >
					<input type="hidden" name="sm<%=(i+1)%>" value="" >
					<input type="hidden" name="ysjg<%=(i+1)%>" value="<%=ysjg%>" >
				  </td>
					<%
					if (sfxzjg.equals("Y"))//是否选择甲供  Y：选择；N：否
					{
						%>
						  <td ><input type="hidden" name="sgf<%=(i+1)%>" value="" ></td>
						<%
					}
					else{
						%>
						<input type="hidden" name="sgf<%=(i+1)%>" value="" >
						<%
					}
					%>
				</tr>
				<%

			}
			else if (ysjg.equals("3"))//1：选择合格；2：选择是否；3：录入字符；4：录入日期；5：录入数字；9：显示说明
			{
				%>
				<tr bgcolor="<%=bgcolor%>" align="center">
				  <%
					if (xmfl.equals(""))
					{
						%>
						  <td ><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx>1)
					{
						%>
						  <td rowspan="<%=hbx%>"><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx==1)
					{
						%>
						  <td><%=xmfl%></td>
						<%
					}
				  %>
				  <td align="right"><%=ys%></td>
				  <td ><%=byxmc%>
					<input type="hidden" name="byx<%=(i+1)%>" value="<%=byx%>" >
				  </td>
				  <td colspan="3" align="left">
					<textarea name="ys<%=(i+1)%>" cols="45" rows="3"></textarea>
					<input type="hidden" name="sm<%=(i+1)%>" value="" >
					<input type="hidden" name="ysjg<%=(i+1)%>" value="<%=ysjg%>" >
				  </td>
					<%
					if (sfxzjg.equals("Y"))//是否选择甲供  Y：选择；N：否
					{
						%>
						  <td ><input type="hidden" name="sgf<%=(i+1)%>" value="" ></td>
						<%
					}
					else{
						%>
						<input type="hidden" name="sgf<%=(i+1)%>" value="" >
						<%
					}
					%>
				</tr>
				<%

			}
			else if (ysjg.equals("4"))//1：选择合格；2：选择是否；3：录入字符；4：录入日期；5：录入数字；9：显示说明
			{
				%>
				<tr bgcolor="<%=bgcolor%>" align="center">
				  <%
					if (xmfl.equals(""))
					{
						%>
						  <td ><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx>1)
					{
						%>
						  <td rowspan="<%=hbx%>"><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx==1)
					{
						%>
						  <td><%=xmfl%></td>
						<%
					}
				  %>
				  <td align="right"><%=ys%></td>
				  <td ><%=byxmc%>
					<input type="hidden" name="byx<%=(i+1)%>" value="<%=byx%>" >
				  </td>
				  <td colspan="3" align="left">
					<input type="text" name="ys<%=(i+1)%>" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
					<input type="hidden" name="sm<%=(i+1)%>" value="" >
					<input type="hidden" name="ysjg<%=(i+1)%>" value="<%=ysjg%>" >
				  </td>
					<%
					if (sfxzjg.equals("Y"))//是否选择甲供  Y：选择；N：否
					{
						%>
						  <td ><input type="hidden" name="sgf<%=(i+1)%>" value="" ></td>
						<%
					}
					else{
						%>
						<input type="hidden" name="sgf<%=(i+1)%>" value="" >
						<%
					}
					%>
				</tr>
				<%

			}
			else if (ysjg.equals("5"))//1：选择合格；2：选择是否；3：录入字符；4：录入日期；5：录入数字；9：显示说明
			{
				%>
				<tr bgcolor="<%=bgcolor%>" align="center">
				  <%
					if (xmfl.equals(""))
					{
						%>
						  <td ><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx>1)
					{
						%>
						  <td rowspan="<%=hbx%>"><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx==1)
					{
						%>
						  <td><%=xmfl%></td>
						<%
					}
				  %>
				  <td align="right"><%=ys%></td>
				  <td ><%=byxmc%>
					<input type="hidden" name="byx<%=(i+1)%>" value="<%=byx%>" >
				  </td>
				  <td colspan="3" align="left">
					<input type="text" name="ys<%=(i+1)%>" value="" size="20" maxlength="16" >
					<input type="hidden" name="sm<%=(i+1)%>" value="" >
					<input type="hidden" name="ysjg<%=(i+1)%>" value="<%=ysjg%>" >
				  </td>
					<%
					if (sfxzjg.equals("Y"))//是否选择甲供  Y：选择；N：否
					{
						%>
						  <td ><input type="hidden" name="sgf<%=(i+1)%>" value="" ></td>
						<%
					}
					else{
						%>
						<input type="hidden" name="sgf<%=(i+1)%>" value="" >
						<%
					}
					%>
				</tr>
				<%

			}
			else //9：显示说明
			{
				if (!ys.equals(""))
				{
					ysbzsm=ys+"：<BR>"+ysbzsm;
				}
				%>
				<tr bgcolor="#FFFFFF" align="center">
				  <%
					if (xmfl.equals(""))
					{
						%>
						  <td ><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx>1)
					{
						%>
						  <td rowspan="<%=hbx%>"><%=xmfl%></td>
						<%
					}
					else if (!xmfl.equals("") && hbx==1)
					{
						%>
						  <td><%=xmfl%></td>
						<%
					}
				  %>
				  <td align="left" colspan="5"><%=ysbzsm%>
					<input type="hidden" name="byx<%=(i+1)%>" value="<%=byx%>" >
					<input type="hidden" name="sm<%=(i+1)%>" value="" >
					<input type="hidden" name="ys<%=(i+1)%>" value="" >
					<input type="hidden" name="ysjg<%=(i+1)%>" value="<%=ysjg%>" >
				  </td>
					<%
					if (sfxzjg.equals("Y"))//是否选择甲供  Y：选择；N：否
					{
						%>
						  <td ><input type="hidden" name="sgf<%=(i+1)%>" value="" ></td>
						<%
					}
					else{
						%>
						<input type="hidden" name="sgf<%=(i+1)%>" value="" >
						<%
					}
					%>

				</tr>
				<%

			}

		}

		for (int i=yszxsl;i<50 ;i++ )
		{
			%>
			<input type="hidden" name="ys<%=(i+1)%>" value="" >
			<input type="hidden" name="sm<%=(i+1)%>" value="" >
			<input type="hidden" name="sgf<%=(i+1)%>" value="" >
			<%
		}
	}
	rs.close();
	ps.close();
%>


    <tr align="center"> 
      <td colspan="5"> 
		<input type="hidden" name="ysjlh" value="<%=ysjlh%>" >
		<input type="hidden" name="khbh" value="<%=khbh%>" >
		<input type="hidden" name="gcysxmbm" value="<%=gcysxmbm%>" >
		<input type="hidden" name="yszxsl" value="<%=yszxsl%>" >

		<input type="button"  value="存盘" onClick="f_do(insertform)">
		<input type="reset"  value="重输" name="reset">
      </td>
    </tr>
</table>
</form>
</body>
</html>

<%
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



<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


function f_sczp(FormName,ysjlh,khbh,gcysxmbm,zpxmbm,zpxm,zpml)//参数FormName:Form的名称
{
	if(new RegExp('Linux').test(navigator.platform.toString()))
	{
		var urlStr="LoadYszxZpPad.jsp?ysjlh="+ysjlh+"&khbh="+khbh+"&gcysxmbm="+gcysxmbm+"&zpml="+zpml+"&zpxmbm="+zpxmbm+"&zpxm="+encodeURI(zpxm);
		window.open(urlStr);
	}
	else
	{
		var urlStr="LoadYszxZp.jsp?ysjlh="+ysjlh+"&khbh="+khbh+"&gcysxmbm="+gcysxmbm+"&zpml="+zpml+"&zpxmbm="+zpxmbm+"&zpxm="+encodeURI(zpxm);
		window.open(urlStr);
	}
}


function f_ckzp(FormName,ysjlh,zpxmbm)//参数FormName:Form的名称
{
	var urlStr="ViewZpZx.jsp?ysjlh="+ysjlh+"&zpxmbm="+zpxmbm;
	window.open(urlStr);
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("请输入[验收记录号]！");
		FormName.ysjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gcysxmbm)=="") {
		alert("请输入[验收项目编码]！");
		FormName.gcysxmbm.focus();
		return false;
	}

	var fbyxsl=0;

	if (<%=yszxsl%> > 1)
	{
		for (var i=0;i< <%=yszxsl%> ;i++ )
		{
			
			if (  eval("FormName.byx"+(i+1)+".value==\"1\"")  )//0.否 1.必验项
			{
				if (eval("FormName.ysjg"+(i+1)+".value==\"1\""))//1：选择合格；2：选择是否；3：录入字符；4：录入日期；5：录入数字；9：显示说明
				{
					if(	 eval("!radioChecked(FormName.ys"+(i+1)+")") ) {
						alert("此项必验，请选择[验收结果]！");
						eval("FormName.ys"+(i+1)+"[0].focus()");
						return false;
					}
				}
				else if (eval("FormName.ysjg"+(i+1)+".value==\"2\""))//1：选择合格；2：选择是否；3：录入字符；4：录入日期；5：录入数字；9：显示说明
				{
					if(	 eval("!radioChecked(FormName.ys"+(i+1)+")") ) {
						alert("此项必选，请选择[结果]！");
						eval("FormName.ys"+(i+1)+"[0].focus()");
						return false;
					}
				}
				else if (eval("FormName.ysjg"+(i+1)+".value==\"4\""))//1：选择合格；2：选择是否；3：录入字符；4：录入日期；5：录入数字；9：显示说明
				{
					if(	 eval("FormName.ys"+(i+1)+".value==''") ) {
						alert("此项必添，请输入[日期]！");
						eval("FormName.ys"+(i+1)+".focus()");
						return false;
					}
					if(	 eval("!isDatetime(FormName.ys"+(i+1)+",'日期')") ) 
					{
						return false;
					}
				}
				else if (eval("FormName.ysjg"+(i+1)+".value==\"5\""))//1：选择合格；2：选择是否；3：录入字符；4：录入日期；5：录入数字；9：显示说明
				{
					if(	 eval("FormName.ys"+(i+1)+".value==''") ) {
						alert("此项必添，请输入[数字]！");
						eval("FormName.ys"+(i+1)+".focus()");
						return false;
					}
					if(	 eval("!isFloat(FormName.ys"+(i+1)+",'数字')") ) 
					{
						return false;
					}
				}
			}
			else{//0.非必验项
				if (eval("FormName.ysjg"+(i+1)+".value==\"1\""))//1：选择合格；2：选择是否；3：录入字符；4：录入日期；5：录入数字；9：显示说明
				{
					if(	 eval("radioChecked(FormName.ys"+(i+1)+")") ) 
					{
						fbyxsl++;
					}
				}
				else if (eval("FormName.ysjg"+(i+1)+".value==\"2\""))//1：选择合格；2：选择是否；3：录入字符；4：录入日期；5：录入数字；9：显示说明
				{
					if(	 eval("radioChecked(FormName.ys"+(i+1)+")") ) 
					{
						fbyxsl++;
					}
				}
				else if (eval("FormName.ysjg"+(i+1)+".value==\"4\""))//1：选择合格；2：选择是否；3：录入字符；4：录入日期；5：录入数字；9：显示说明
				{
					if(	 eval("!isDatetime(FormName.ys"+(i+1)+",'日期')") ) 
					{
						return false;
					}
				}
				else if (eval("FormName.ysjg"+(i+1)+".value==\"5\""))//1：选择合格；2：选择是否；3：录入字符；4：录入日期；5：录入数字；9：显示说明
				{
					if(	 eval("!isFloat(FormName.ys"+(i+1)+",'数字')") ) 
					{
						return false;
					}
				}
			}
			
			if (eval("FormName.ysjg"+(i+1)+".value==\"1\""))//1：选择合格；2：选择是否；3：录入字符；4：录入日期；5：录入数字；9：显示说明
			{
				if (eval("FormName.ys"+(i+1)+"[1].checked"))
				{
					if(	eval("javaTrim(FormName.sm"+(i+1)+")==\"\" ")) {
						alert("此项需整改，请录入[备注]！");
						eval("FormName.sm"+(i+1)+".focus()");
						return false;
					}
				}
			}

		}
	}
	else{
	}
	

	if (fbyxsl < <%=fbyxzxsl%>)
	{
		alert("错误！非必验项要求至少验<%=fbyxzxsl%>项，目前只验"+fbyxsl+"项");
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
