<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));

String xh=null;
String zcbm=null;
double zqdj=0;
double dpzk=0;
double dj=0;
double sl=0;
double zqje=0;
double je=0;
double ycf=0;
String zcpzwzbm=null;
String zcysbm=null;
String cxhdbz=null;
String bz=null;
String jldwbm=null;
String qtfy=null;
String xzjg=null;
String zcmc=null;
String zclbbm=null;
String xinghao=null;
String gg=null;
String sfbhpj=null;
String pjts=null;
String lsj=null;
String yhj=null;
String sfycx=null;
String cxj=null;
String cxkssj=null;
String cxjzsj=null;
String bjbz=null;
double qtfyje=0;
String cxhdbl=null;
String cxhdje=null;
String gys=null;
String ppmc=null;
double cbj=0;
double bzcbj=0;
double bzcxhdbl=0;
double cxcbj=0;
double lscxhdbl=0;
String sftjcp=null;
String sxbz=null;
String sxbzmc=null;
String sxhtyy=null;

String dqbm=null;
double zxqdl=0;
String xsfs=null;
String xsfsmc=null;
double zcpzsl=0;
double dhsl=0;
double xhsl=0;
String sfzp=null;
double zsdj=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;
int allrow=0;

try {
	conn=cf.getConnection();

	ls_sql="select dqbm";
	ls_sql+=" from  jc_zcdd,sq_dwxx";
	ls_sql+=" where jc_zcdd.fgsbh=sq_dwxx.dwbh and jc_zcdd.ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();
%>

<html>
<head>
<title>请修改主材订单明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
-->
</style>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>


 <div align="center">请修改主材订单明细（订单编号：<%=ddbh%>）</div>


<DIV style="DISPLAY: inline; OVERFLOW: auto;  WIDTH: 100%;  HEIGHT:97%"> 

<TABLE  bgcolor="#999999" cellpadding="0" cellspacing="0" border=1 width="270%" style='FONT-SIZE: 12px'>
<form method="post" action="" name="editform">
<TR bgcolor="#CCCCCC"  align="center" style="FONT-WEIGHT: bold; Z-INDEX: 5; POSITION: relative;TOP: expression(this.offsetParent.scrollTop)"> 
	<td  width="1%" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
	<td  width="2%" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #CC6600">主材编码</td>
	<td  width="5%" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #CC6600">主材名称</td>
	<td  width="4%" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #CC6600">型号</td>
	<td  width="4%" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #CC6600">规格</td>
	<td  width="2%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">颜色</td>
	<td  width="3%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">铺装位置</td>
	<td  width="2%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">选择价格</span></td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">折前单价</span></td>
	<td  width="2%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">折扣</span></td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">折后单价</span></td>
	<td  width="2%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">计量单位</span></td>
	<td  width="3%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">数量</td>
	<td  width="2%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">销售方式</td>
	<td  width="2%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">库存数</td>
	<td  width="2%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">订货数</td>
	<td  width="2%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">最小起订量</td>
	<td  width="2%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">可订货数</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">折前材料费</span></td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">折后材料费</span></td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">远程费</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">选择其它费</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">其它费金额</td>
	<td  width="2%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">是否赠品</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">赠送单价</td>
	<td  width="2%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">参加促销活动</span></td>
	<td  width="3%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">计入促销活动比率</span></td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">计入促销活动金额</span></td>
	<td  width="2%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">修改数量</td>
	<td  width="18%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">备注</td>
	<td  width="7%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">系列</td>
</tr>


<%
	ls_sql="select xh,zcbm,zcmc,zclbbm,xinghao,gg,zqdj,dpzk,dj,sl,zqje,je,ycf,zcpzwzbm,zcysbm,cxhdbz,bz,jldwbm,qtfy,xzjg,DECODE(sfbhpj,'Y','包含','N','不包含') sfbhpj,pjts,lsj,yhj";
	ls_sql+=" ,sfycx,cxj,cxkssj,cxjzsj,qtfyje,cxhdbl,cxhdje,gys,ppmc,cbj,bzcbj,bzcxhdbl,cxcbj,lscxhdbl,DECODE(sftjcp,'Y','是','N','否') sftjcp";
	ls_sql+=" ,sxbz,DECODE(sxbz,'1','非手写','2','手写') sxbzmc,sxhtyy,sfzp,zsdj ";
	ls_sql+=" from  jc_zcddmx";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ls_sql+=" order by sxbz,xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zsdj=rs.getDouble("zsdj");
		sfzp=cf.fillNull(rs.getString("sfzp"));
		xh=cf.fillNull(rs.getString("xh"));
		sxbz=cf.fillNull(rs.getString("sxbz"));
		sxbzmc=cf.fillNull(rs.getString("sxbzmc"));
		sxhtyy=cf.fillHtml(rs.getString("sxhtyy"));
		zcbm=cf.fillNull(rs.getString("zcbm"));
		zcmc=cf.fillHtml(rs.getString("zcmc"));
		zclbbm=cf.fillHtml(rs.getString("zclbbm"));
		xinghao=cf.fillHtml(rs.getString("xinghao"));
		gg=cf.fillHtml(rs.getString("gg"));
		zqdj=rs.getDouble("zqdj");
		dpzk=rs.getDouble("dpzk");
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		zqje=rs.getDouble("zqje");
		je=rs.getDouble("je");
		ycf=rs.getDouble("ycf");
		zcpzwzbm=cf.fillNull(rs.getString("zcpzwzbm"));
		zcysbm=cf.fillNull(rs.getString("zcysbm"));
		cxhdbz=cf.fillNull(rs.getString("cxhdbz"));
		bz=cf.fillNull(rs.getString("bz"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		qtfy=cf.fillNull(rs.getString("qtfy"));
		xzjg=cf.fillNull(rs.getString("xzjg"));
		sfbhpj=cf.fillNull(rs.getString("sfbhpj"));
		pjts=cf.fillNull(rs.getString("pjts"));
		lsj=cf.fillNull(rs.getString("lsj"));
		yhj=cf.fillNull(rs.getString("yhj"));
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxj=cf.fillNull(rs.getString("cxj"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		qtfyje=rs.getDouble("qtfyje");
		cxhdbl=cf.fillNull(rs.getString("cxhdbl"));
		cxhdje=cf.fillNull(rs.getString("cxhdje"));
		gys=cf.fillNull(rs.getString("gys"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		cbj=rs.getDouble("cbj");
		bzcbj=rs.getDouble("bzcbj");
		bzcxhdbl=rs.getDouble("bzcxhdbl");
		cxcbj=rs.getDouble("cxcbj");
		lscxhdbl=rs.getDouble("lscxhdbl");
		sftjcp=cf.fillNull(rs.getString("sftjcp"));

		ls_sql="select zxqdl,zcpzsl,dhsl,zcpzsl-dhsl xhsl,xsfs,DECODE(xsfs,'1','代销品','2','现货','3','期货销售') xsfsmc,bz";
		ls_sql+=" from  jxc_cljgb";
		ls_sql+=" where clbm='"+zcbm+"' and dqbm='"+dqbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zxqdl=rs1.getDouble("zxqdl");
			zcpzsl=rs1.getDouble("zcpzsl");//正常品总数量
			dhsl=rs1.getDouble("dhsl");
			xhsl=rs1.getDouble("xhsl");
			xsfs=cf.fillNull(rs1.getString("xsfs"));
			xsfsmc=cf.fillNull(rs1.getString("xsfsmc"));
			bjbz=cf.fillNull(rs1.getString("bz"));
		}
		rs1.close();
		ps1.close();

		String slStr="";
		if (sl!=0)
		{
			slStr=sl+"";
		}
		String ycfStr="";
		if (ycf!=0)
		{
			ycfStr=ycf+"";
		}
		String qtfyjeStr="";
		if (qtfyje!=0)
		{
			qtfyjeStr=qtfyje+"";
		}

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
				<input name="xh" type="checkbox" value="<%=xh%>">
			</td>
			<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
				<input type="hidden" name="zcbm" value="<%=zcbm%>">
				<input type="hidden" name="xzxh" value="<%=xh%>">
				<A HREF="EditJc_zcddmxMain.jsp?ddbh=<%=ddbh%>&xh=<%=xh%>" target="_blank"><%=zcbm%></A>
			</td>
			<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
				<%=zcmc%>
			</td>
			<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
				<%=xinghao%>
			</td>
			<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
				<%=gg%>
			</td>
			<td >
				<input type="text" name="zcysbm" size="7" maxlength="50"  value="<%=zcysbm%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
			<td >
				<select name="zcpzwzbm" style="FONT-SIZE:12PX;WIDTH:80PX" >
				  <option value=""></option>
				  <%
					cf.selectItem(out,"select pzwz c1,pzwz c2 from jdm_pzwz  order by pzwz",zcpzwzbm);
				  %>
				</select>			</td>
			<td bgcolor="#CC99FF">
				<%
					cf.radioToken(out,"0+手写项&1+销价&2+促销价",xzjg,true);
				%>			</td>
			<td bgcolor="#CC99FF">
				<input type="text" name="zqdj" size="8" maxlength="16"  value="<%=zqdj%>" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">			</td>
			<td bgcolor="#CC99FF" >
				<input type="text" name="dpzk" size="5" maxlength="9"  value="<%=dpzk%>" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">			</td>
			<td bgcolor="#CC99FF" >
				<input type="text" name="dj" size="8" maxlength="16"  value="<%=dj%>" readonly  style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">			</td>
			<td bgcolor="#CC99FF">
				<%
					cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm where jldwbm='"+jldwbm+"'",jldwbm,true);
				%>			</td>
			<td >
				<input type="text" name="sl" size="7" maxlength="16"  value="<%=slStr%>" onChange="f_jsjg(editform,<%=row%>)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
			<td bgcolor="#CC99FF"><%=xsfsmc%>
				<input type="hidden" name="xsfs"  value="<%=xsfs%>" >
			</td>
			<td bgcolor="#CC99FF"><%=zcpzsl%>
				<input type="hidden" name="zcpzsl"  value="<%=zcpzsl%>" >
			</td>
			<td bgcolor="#CC99FF"><%=dhsl%>
				<input type="hidden" name="dhsl"  value="<%=dhsl%>" >
			</td>
			<td bgcolor="#CC99FF"><%=zxqdl%>
				<input type="hidden" name="zxqdl"  value="<%=zxqdl%>" >
			</td>
			<td bgcolor="#CC99FF"><%=xhsl%></td>
			<td bgcolor="#CC99FF">
				<input type="text" name="zqje" size="8" maxlength="16"  value="<%=zqje%>" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">			</td>
			<td bgcolor="#CC99FF">
				<input type="text" name="je" size="8" maxlength="16"  value="<%=je%>" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">			</td>
			<td >
				<input type="text" name="ycf" size="8" maxlength="16"  value="<%=ycfStr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
			<td >
				<select name="qtfy" style="FONT-SIZE:12PX;WIDTH:70PX" >
				  <option value=""></option>
				  <%
					cf.selectToken(out,"1+安装费&2+加工费&3+其它收费&W+无",qtfy);
				  %>
				</select>			</td>
			<td >
				<input type="text" name="qtfyje" size="8" maxlength="16"  value="<%=qtfyjeStr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
			<td >
				<select name="sfzp" style="FONT-SIZE:12PX;WIDTH:50PX" >
				  <option value=""></option>
				  <%
					cf.selectToken(out,"Y+赠品&N+否",sfzp);
				  %>
				</select>			
			</td>
			<td >
				<input type="text" name="zsdj" size="8" maxlength="16"  value="<%=zsdj%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			
			</td>
			<td bgcolor="#CC99FF" >
				<input type="hidden" name="cxhdbz" value="<%=cxhdbz%>">
				<%
					cf.radioToken(out,"Y+参加&N+不参加",cxhdbz,true);
				%>			</td>
			<td bgcolor="#CC99FF" >
				<input type="text" name="cxhdbl" size="5" maxlength="9"  value="<%=cxhdbl%>" onChange="f_jsjg(editform,<%=row%>)" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">%			</td>
			<td bgcolor="#CC99FF">
				<input type="text" name="cxhdje" size="8" maxlength="16"  value="<%=cxhdje%>" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">			</td>
			<td >
				<A HREF="EditJc_zcddmxMain.jsp?ddbh=<%=ddbh%>&xh=<%=xh%>" target="_blank">修改</A>
			</td>
			<td >
				<input name="bz" type="text" value="<%=bz%>" size="67" maxlength="300" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
			<td bgcolor="#CC99FF"><%=zclbbm%></td>
		</tr>
		<%

		row++;

		allrow++;
	}
	rs.close();
	ps.close();


}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<tr> 
	<td colspan="5" align="center" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
		<input type="hidden" name="ddbh" value="<%=ddbh%>">
		<input type="button" value="保存" onClick="f_do(editform)" >
		<input type="button" value='全选' onClick="f_checkAll(editform)" >
		<input type="button" value='删除被选项目' onClick="f_delete(editform)" >
	</td>
	<td colspan="23" >&nbsp;</td>
</tr>
</form>
</table>
</DIV>





</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_jsjg(FormName,row)//参数FormName:Form的名称
{
	if (<%=row%>==1)
	{
		var zqje=FormName.zqdj.value*FormName.sl.value;
		zqje=round(zqje,2);
		FormName.zqje.value=zqje;

		var je=FormName.dj.value*FormName.sl.value;
		je=round(je,2);
		FormName.je.value=je;

		var cxhdje=FormName.je.value*FormName.cxhdbl.value/100;
		cxhdje=round(cxhdje,2);
		FormName.cxhdje.value=cxhdje;
	}
	else{
		var zqje=FormName.zqdj[row].value*FormName.sl[row].value;
		zqje=round(zqje,2);
		FormName.zqje[row].value=zqje;

		var je=FormName.dj[row].value*FormName.sl[row].value;
		je=round(je,2);
		FormName.je[row].value=je;

		var cxhdje=FormName.je[row].value*FormName.cxhdbl[row].value/100;
		cxhdje=round(cxhdje,2);
		FormName.cxhdje[row].value=cxhdje;
	}
}

function f_do(FormName)//参数FormName:Form的名称
{
	if (<%=row%>==1)
	{
		f_jsjg(FormName,1);

		if(	javaTrim(FormName.zqdj)=="") {
			alert("主材编码["+FormName.zcbm.value+"]出错！请输入[折前实销单价]！");
			FormName.zqdj.focus();
			return false;
		}
		if(!(isFloat(FormName.zqdj, "折前实销单价"))) {
			return false;
		}

		if(	javaTrim(FormName.dpzk)=="") {
			alert("主材编码["+FormName.zcbm.value+"]出错！请输入[折扣率]！");
			FormName.dpzk.focus();
			return false;
		}
		if(!(isFloat(FormName.dpzk, "折扣率"))) {
			return false;
		}
		if (FormName.dpzk.value<0 || FormName.dpzk.value>10)
		{
			alert("主材编码["+FormName.zcbm.value+"]出错！[折扣率]应该在0和10之间！");
			FormName.dpzk.select();
			return false;
		}

		if(	javaTrim(FormName.dj)=="") {
			alert("主材编码["+FormName.zcbm.value+"]出错！请输入[折后实销单价]！");
			FormName.dj.focus();
			return false;
		}
		if(!(isFloat(FormName.dj, "折后实销单价"))) {
			return false;
		}

		if(	javaTrim(FormName.sl)=="") {
			alert("主材编码["+FormName.zcbm.value+"]出错！请输入[订货数量]！");
			FormName.sl.focus();
			return false;
		}
		if(!(isFloat(FormName.sl, "订货数量"))) {
			return false;
		}
		if (parseFloat(FormName.sl.value)<=0)
		{
			alert("主材编码["+FormName.zcbm.value+"]出错！[订货数量]不能<=0！");
			FormName.sl.select();
			return false;
		}
		if (parseFloat(FormName.sl.value)<parseFloat(FormName.zxqdl.value))
		{
			alert("主材编码["+FormName.zcbm.value+"]出错！[订货数量]不能 小于 [最小起订量"+parseFloat(FormName.zxqdl.value)+"]");
			FormName.sl.select();
			return false;
		}
		if (FormName.xsfs.value=="2")//1：代销品；2：现货销售；3：库存无货可销售
		{
			var kdhsl=parseFloat(FormName.zcpzsl.value);
			if (  parseFloat(FormName.sl.value)  > kdhsl )
			{
				alert("主材编码["+FormName.zcbm.value+"]出错！该产品现货销售，[订货数量]不能 大于 [可订货数"+kdhsl+"]");
				FormName.sl.select();
				return false;
			}
		}
		else if (FormName.xsfs.value=="3")//1：代销品；2：现货销售；3：库存无货可销售
		{
		}
		else{
			alert("主材编码["+FormName.zcbm.value+"]出错！错误！[销售方式]不正确："+FormName.xsfs.value);
			return false;
		}

		if(	javaTrim(FormName.zqje)=="") {
			alert("主材编码["+FormName.zcbm.value+"]出错！请输入[折前材料费]！");
			FormName.zqje.focus();
			return false;
		}
		if(!(isFloat(FormName.zqje, "折前材料费"))) {
			return false;
		}
		if(	javaTrim(FormName.je)=="") {
			alert("主材编码["+FormName.zcbm.value+"]出错！请输入[折后材料费]！");
			FormName.je.focus();
			return false;
		}
		if(!(isFloat(FormName.je, "折后材料费"))) {
			return false;
		}

		if(!(isFloat(FormName.ycf, "远程费"))) {
			return false;
		}

		if(	javaTrim(FormName.qtfy)=="") 
		{
			alert("主材编码["+FormName.zcbm.value+"]出错！请选择[其它费用]！");
			FormName.qtfy.select();
			return false;
		}

		if (FormName.qtfy.value!="W")
		{
			if(	javaTrim(FormName.qtfyje)=="") {
				alert("主材编码["+FormName.zcbm.value+"]出错！请输入[其它费金额]！");
				FormName.qtfyje.focus();
				return false;
			}
			if(!(isFloat(FormName.qtfyje, "其它费金额"))) {
				return false;
			}
			if (FormName.qtfyje.value=="0")
			{
				alert("主材编码["+FormName.zcbm.value+"]出错！[其它费金额]不能为0！");
				FormName.qtfyje.select();
				return false;
			}
		}
		else{
			if(	javaTrim(FormName.qtfyje)!="" && FormName.qtfyje.value!="0") 
			{
				alert("主材编码["+FormName.zcbm.value+"]出错！没有收[其它费]！");
				FormName.qtfyje.select();
				return false;
			}
		}

		if (FormName.cxhdbz.value=="Y")
		{
			if(	javaTrim(FormName.cxhdbl)=="") {
				alert("主材编码["+FormName.zcbm.value+"]出错！请输入[计入促销活动比率]！");
				FormName.cxhdbl.focus();
				return false;
			}
			if(!(isFloat(FormName.cxhdbl, "计入促销活动比率"))) {
				return false;
			}
			if (FormName.cxhdbl.value<=0 || FormName.cxhdbl.value>100)
			{
				alert("主材编码["+FormName.zcbm.value+"]出错！[计入促销活动比率]应在0％和100％之间！");
				FormName.cxhdbl.select();
				return false;
			}
		}
		else{
			if(	javaTrim(FormName.cxhdbl)!="" && FormName.cxhdbl.value!="0") {
				alert("主材编码["+FormName.zcbm.value+"]出错！不参加促销活动，[计入促销活动比率]应为0！");
				FormName.cxhdbl.select();
				return false;
			}
			if(	javaTrim(FormName.cxhdje)!="" && FormName.cxhdje.value!="0") {
				alert("主材编码["+FormName.zcbm.value+"]出错！不参加促销活动，[计入促销活动金额]应为0！");
				FormName.cxhdbl.select();
				return false;
			}
		}
		if(	javaTrim(FormName.sfzp)=="") {
			alert("主材编码["+FormName.zcbm.value+"]出错！请选择[是否赠品]！");
			FormName.sfzp.focus();
			return false;
		}

		if (FormName.sfzp.value=="Y")
		{
			if (parseFloat(FormName.dj.value)!=0)
			{
				alert("错误！赠品【折后实销单价】应为0");
				FormName.dj.select();
				return false;
			}
			if(	javaTrim(FormName.zsdj)=="") {
				alert("请输入[赠送单价]！");
				FormName.zsdj.focus();
				return false;
			}
			if(!(isFloat(FormName.zsdj, "赠送单价"))) {
				return false;
			}
			if (parseFloat(FormName.zsdj.value)==0)
			{
				alert("错误！赠品【赠送单价】不能为0");
				FormName.zsdj.select();
				return false;
			}
		}
		else{
			if (parseFloat(FormName.dj.value)==0)
			{
				alert("错误！非赠品【折后实销单价】不能为0");
				FormName.dj.select();
				return false;
			}

			if(	javaTrim(FormName.zsdj)=="") {
				alert("请输入[赠送单价]！");
				FormName.zsdj.focus();
				return false;
			}
			if(!(isFloat(FormName.zsdj, "赠送单价"))) {
				return false;
			}
			if (parseFloat(FormName.zsdj.value)!=0)
			{
				alert("错误！非赠品【赠送单价】应为0");
				FormName.zsdj.select();
				return false;
			}
		}
	}
	else{
		for (var i=0;i< <%=row%> ;i++ )
		{
			f_jsjg(FormName,i);

			if(	javaTrim(FormName.zqdj[i])=="") {
				alert("主材编码["+FormName.zcbm[i].value+"]出错！请输入[折前实销单价]！");
				FormName.zqdj[i].focus();
				return false;
			}
			if(!(isFloat(FormName.zqdj[i], "折前实销单价"))) {
				return false;
			}

			if(	javaTrim(FormName.dpzk[i])=="") {
				alert("主材编码["+FormName.zcbm[i].value+"]出错！请输入[折扣率]！");
				FormName.dpzk[i].focus();
				return false;
			}
			if(!(isFloat(FormName.dpzk[i], "折扣率"))) {
				return false;
			}
			if (FormName.dpzk[i].value<0 || FormName.dpzk[i].value>10)
			{
				alert("主材编码["+FormName.zcbm[i].value+"]出错！[折扣率]应该在0和10之间！");
				FormName.dpzk[i].select();
				return false;
			}

			if(	javaTrim(FormName.dj[i])=="") {
				alert("主材编码["+FormName.zcbm[i].value+"]出错！请输入[折后实销单价]！");
				FormName.dj[i].focus();
				return false;
			}
			if(!(isFloat(FormName.dj[i], "折后实销单价"))) {
				return false;
			}

			if(	javaTrim(FormName.sl[i])=="") {
				alert("主材编码["+FormName.zcbm[i].value+"]出错！请输入[订货数量]！");
				FormName.sl[i].focus();
				return false;
			}
			if(!(isFloat(FormName.sl[i], "订货数量"))) {
				return false;
			}
			if (parseFloat(FormName.sl[i].value)<=0)
			{
				alert("主材编码["+FormName.zcbm[i].value+"]出错！[订货数量]不能<=0！");
				FormName.sl[i].select();
				return false;
			}
			if (parseFloat(FormName.sl[i].value)<parseFloat(FormName.zxqdl[i].value))
			{
				alert("主材编码["+FormName.zcbm[i].value+"]出错！[订货数量]不能 小于 [最小起订量"+parseFloat(FormName.zxqdl[i].value)+"]");
				FormName.sl[i].select();
				return false;
			}
			if (FormName.xsfs[i].value=="2")//1：代销品；2：现货销售；3：库存无货可销售
			{
				var kdhsl=parseFloat(FormName.zcpzsl[i].value);
				if (  parseFloat(FormName.sl[i].value)  > kdhsl )
				{
					alert("主材编码["+FormName.zcbm[i].value+"]出错！该产品现货销售，[订货数量]不能 大于 [可订货数"+kdhsl+"]");
					FormName.sl[i].select();
					return false;
				}
			}
			else if (FormName.xsfs[i].value=="3")//1：代销品；2：现货销售；3：库存无货可销售
			{
			}
			else{
				alert("主材编码["+FormName.zcbm[i].value+"]出错！错误！[销售方式]不正确："+FormName.xsfs[i].value);
				return false;
			}

			if(	javaTrim(FormName.zqje[i])=="") {
				alert("主材编码["+FormName.zcbm[i].value+"]出错！请输入[折前材料费]！");
				FormName.zqje[i].focus();
				return false;
			}
			if(!(isFloat(FormName.zqje[i], "折前材料费"))) {
				return false;
			}
			if(	javaTrim(FormName.je[i])=="") {
				alert("主材编码["+FormName.zcbm[i].value+"]出错！请输入[折后材料费]！");
				FormName.je[i].focus();
				return false;
			}
			if(!(isFloat(FormName.je[i], "折后材料费"))) {
				return false;
			}

			if(!(isFloat(FormName.ycf[i], "远程费"))) {
				return false;
			}

			if(	javaTrim(FormName.qtfy[i])=="") 
			{
				alert("主材编码["+FormName.zcbm[i].value+"]出错！请选择[其它费用]！");
				FormName.qtfy[i].select();
				return false;
			}

			if (FormName.qtfy[i].value!="W")
			{
				if(	javaTrim(FormName.qtfyje[i])=="") {
					alert("主材编码["+FormName.zcbm[i].value+"]出错！请输入[其它费金额]！");
					FormName.qtfyje[i].focus();
					return false;
				}
				if(!(isFloat(FormName.qtfyje[i], "其它费金额"))) {
					return false;
				}
				if (FormName.qtfyje[i].value=="0")
				{
					alert("主材编码["+FormName.zcbm[i].value+"]出错！[其它费金额]不能为0！");
					FormName.qtfyje[i].select();
					return false;
				}
			}
			else{
				if(	javaTrim(FormName.qtfyje[i])!="" && FormName.qtfyje[i].value!="0") 
				{
					alert("主材编码["+FormName.zcbm[i].value+"]出错！没有收[其它费]！");
					FormName.qtfyje[i].select();
					return false;
				}
			}

			if (FormName.cxhdbz[i].value=="Y")
			{
				if(	javaTrim(FormName.cxhdbl[i])=="") {
					alert("主材编码["+FormName.zcbm[i].value+"]出错！请输入[计入促销活动比率]！");
					FormName.cxhdbl.focus();
					return false;
				}
				if(!(isFloat(FormName.cxhdbl[i], "计入促销活动比率"))) {
					return false;
				}
				if (FormName.cxhdbl[i].value<=0 || FormName.cxhdbl[i].value>100)
				{
					alert("主材编码["+FormName.zcbm[i].value+"]出错！[计入促销活动比率]应在0％和100％之间！");
					FormName.cxhdbl[i].select();
					return false;
				}
			}
			else{
				if(	javaTrim(FormName.cxhdbl[i])!="" && FormName.cxhdbl[i].value!="0") {
					alert("主材编码["+FormName.zcbm[i].value+"]出错！不参加促销活动，[计入促销活动比率]应为0！");
					FormName.cxhdbl[i].select();
					return false;
				}
				if(	javaTrim(FormName.cxhdje[i])!="" && FormName.cxhdje[i].value!="0") {
					alert("主材编码["+FormName.zcbm[i].value+"]出错！不参加促销活动，[计入促销活动金额]应为0！");
					FormName.cxhdbl[i].select();
					return false;
				}
			}
			if(	javaTrim(FormName.sfzp[i])=="") {
				alert("主材编码["+FormName.zcbm[i].value+"]出错！请选择[是否赠品]！");
				FormName.sfzp[i].focus();
				return false;
			}
			if (FormName.sfzp[i].value=="Y")
			{
				if (parseFloat(FormName.dj[i].value)!=0)
				{
					alert("错误！赠品【折后实销单价】应为0");
					FormName.dj[i].select();
					return false;
				}
				if(	javaTrim(FormName.zsdj[i])=="") {
					alert("请输入[赠送单价]！");
					FormName.zsdj[i].focus();
					return false;
				}
				if(!(isFloat(FormName.zsdj[i], "赠送单价"))) {
					return false;
				}
				if (parseFloat(FormName.zsdj[i].value)==0)
				{
					alert("错误！赠品【赠送单价】不能为0");
					FormName.zsdj[i].select();
					return false;
				}
			}
			else{

				if (parseFloat(FormName.dj[i].value)==0)
				{
					alert("错误！非赠品【折后实销单价】不能为0");
					FormName.dj[i].select();
					return false;
				}
				if(	javaTrim(FormName.zsdj[i])=="") {
					alert("请输入[赠送单价]！");
					FormName.zsdj[i].focus();
					return false;
				}
				if(!(isFloat(FormName.zsdj[i], "赠送单价"))) {
					return false;
				}
				if (parseFloat(FormName.zsdj[i].value)!=0)
				{
					alert("错误！非赠品【赠送单价】应为0");
					FormName.zsdj[i].select();
					return false;
				}
			}
		}
	}


	FormName.action="SaveEditAllJc_zcddmx.jsp";
	FormName.submit();
	return true;
}


var mark=1;
function f_checkAll(FormName)//转换字符串
{
	var i = 0;
	if (<%=allrow%>==1){
		if (mark==0)
		{
			FormName.xh.checked =false
		}
		else{
			FormName.xh.checked =true
		}
	}
	else if (<%=allrow%> >1){ 
		for (i=0;i< <%=allrow%>;i++ ){
			if (mark==0)
			{
				FormName.xh[i].checked =false
			}
			else{
				FormName.xh[i].checked =true
			}
		}
	}
	if (mark==0)
	{
		mark=1;
	}
	else{
		mark=0;
	}
}

function f_delete(FormName)
{
	var choo=0;
	if ( confirm("注意！删除后不可恢复，确实要删除数据吗?") )	{
		var i = 0;
		if (<%=allrow%>==1){
			if( FormName.xh.checked ){
				choo=1;
			}
		} 
		else if (<%=allrow%>>1){ 
			for (i=0;i< <%=allrow%>;i++ ){
				if( FormName.xh[i].checked ){
					choo=1;
				}
			} 
		} 
		if (choo == 0){
			alert("请选择要删除的数据");
			return false;
		}
		else{
			FormName.action="DeleteJc_zcddmx.jsp";
			FormName.submit();
			return true;
		}
	}
} 

//-->
</SCRIPT>
