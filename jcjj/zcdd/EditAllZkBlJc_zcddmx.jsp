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
String sfzp=null;
double zsdj=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int row=0;
int allrow=0;

try {
	conn=cf.getConnection();
%>

<html>
<head>
<title>���޸����Ķ�����ϸ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
-->
</style>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>


 <div align="center">���޸����Ķ�����ϸ��������ţ�<%=ddbh%>��</div>


<DIV style="DISPLAY: inline; OVERFLOW: auto;  WIDTH: 100%;  HEIGHT:97%"> 

<TABLE  bgcolor="#999999" cellpadding="0" cellspacing="0" border=1 width="270%" style='FONT-SIZE: 12px'>
<form method="post" action="" name="editform">
<TR bgcolor="#CCCCCC"  align="center" style="FONT-WEIGHT: bold; Z-INDEX: 5; POSITION: relative;TOP: expression(this.offsetParent.scrollTop)"> 
	<td  width="1%" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
	<td  width="3%" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #CC6600">���ı���</td>
	<td  width="5%" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #CC6600">��������</td>
	<td  width="4%" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #CC6600">�ͺ�</td>
	<td  width="4%" style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #CC6600">���</td>
	<td  width="2%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">��ɫ</td>
	<td  width="3%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">��װλ��</td>
	<td  width="2%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">ѡ��۸�</span></td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">��ǰ����</span></td>
	<td  width="2%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">�ۿ�</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">�ۺ󵥼�</span></td>
	<td  width="2%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">������λ</span></td>
	<td  width="3%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">����</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">��ǰ���Ϸ�</span></td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">�ۺ���Ϸ�</span></td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">Զ�̷�</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">ѡ��������</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">�����ѽ��</td>
	<td  width="2%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">�Ƿ���Ʒ</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">���͵���</td>
	<td  width="2%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">�μӴ����</span></td>
	<td  width="2%" bgcolor="#CC99FF" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">������������</td>
	<td  width="3%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><span class="STYLE1">�����������</span></td>
	<td  width="2%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">��д��־</td>
	<td  width="4%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">��д��ͬԭ��</td>
	<td  width="4%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">�޸���д��ͬ</td>
	<td  width="19%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">��ע</td>
	<td  width="7%" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">ϵ��</td>
</tr>


<%
	ls_sql="select xh,zcbm,zcmc,zclbbm,xinghao,gg,zqdj,dpzk,dj,sl,zqje,je,ycf,zcpzwzbm,zcysbm,cxhdbz,bz,jldwbm,qtfy,xzjg,DECODE(sfbhpj,'Y','����','N','������') sfbhpj,pjts,lsj,yhj";
	ls_sql+=" ,sfycx,cxj,cxkssj,cxjzsj,qtfyje,cxhdbl,cxhdje,gys,ppmc,cbj,bzcbj,bzcxhdbl,cxcbj,lscxhdbl,DECODE(sftjcp,'Y','��','N','��') sftjcp";
	ls_sql+=" ,sxbz,DECODE(sxbz,'1','����д','2','��д') sxbzmc,sxhtyy,sfzp,zsdj ";
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

		if (sxbz.equals("2"))//��д��ͬ
		{
			%>
			<tr bgcolor="#E8E8FF"  align="center">
				<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
					<input name="xh" type="checkbox" value="<%=xh%>">
				</td>
				<td style="LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
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
				<td><%=zcysbm%></td>
				<td><%=zcpzwzbm%></td>
				<td >��д��</td>
				<td ><%=zqdj%></td>
				<td ><%=dpzk%></td>
				<td ><%=dj%></td>
				<td ><%=jldwbm%></td>
				<td ><%=slStr%></td>
				<td ><%=zqje%></td>
				<td ><%=je%></td>
				<td ><%=ycfStr%></td>
				<td >
					  <%
						cf.selectToken(out,"1+��װ��&2+�ӹ���&3+�����շ�&W+��",qtfy,true);
					  %>
				</td>
				<td ><%=qtfyjeStr%>
				<td >
					  <%
						cf.selectToken(out,"Y+��Ʒ&N+��",sfzp,true);
					  %>
				</td>
				<td ><%=zsdj%></td>
				<td  >
					<%
						cf.radioToken(out,"Y+�μ�&N+���μ�",cxhdbz,true);
					%>			
				</td>
				<td  ><%=cxhdbl%>%</td>
				<td ><%=cxhdje%></td>
				<td ><%=sxbzmc%></td>
				<td ><%=sxhtyy%></td>
				<td bgcolor="#FFFFFF">
					<A HREF="EditJc_zcddmxMain.jsp?ddbh=<%=ddbh%>&xh=<%=xh%>" target="_blank">�޸���д��ͬ</A>
				</td>
				<td ><%=bz%></td>
				<td ><%=zclbbm%></td>
			</tr>
			<%
		}
		else{
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
						cf.radioToken(out,"0+��д��&1+����&2+������",xzjg,true);
					%>			</td>
				<td bgcolor="#CC99FF">
					<input type="text" name="zqdj" size="8" maxlength="16"  value="<%=zqdj%>" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">			</td>
				<td >
					<input type="text" name="dpzk" size="5" maxlength="9"  value="<%=dpzk%>" onChange="f_jsjg(editform,<%=row%>)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
				<td bgcolor="#CC99FF">
					<input type="text" name="dj" size="8" maxlength="16"  value="<%=dj%>" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">			</td>
				<td bgcolor="#CC99FF">
					<%
						cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm where jldwbm='"+jldwbm+"'",jldwbm,true);
					%>			</td>
				<td >
					<input type="text" name="sl" size="7" maxlength="16"  value="<%=slStr%>" onChange="f_jsjg(editform,<%=row%>)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
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
						cf.selectToken(out,"1+��װ��&2+�ӹ���&3+�����շ�&W+��",qtfy);
					  %>
					</select>			</td>
				<td >
					<input type="text" name="qtfyje" size="8" maxlength="16"  value="<%=qtfyjeStr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
				<td >
					<select name="sfzp" style="FONT-SIZE:12PX;WIDTH:50PX" >
					  <option value=""></option>
					  <%
						cf.selectToken(out,"Y+��Ʒ&N+��",sfzp);
					  %>
					</select>			
				</td>
				<td >
					<input type="text" name="zsdj" size="8" maxlength="16"  value="<%=zsdj%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			
				</td>
				<td bgcolor="#CC99FF" >
					<input type="hidden" name="cxhdbz" value="<%=cxhdbz%>">
					<%
						cf.radioToken(out,"Y+�μ�&N+���μ�",cxhdbz,true);
					%>			</td>
				<td>
					<input type="text" name="cxhdbl" size="3" maxlength="9"  value="<%=cxhdbl%>" onChange="f_jsjg(editform,<%=row%>)" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">%			</td>
				<td bgcolor="#CC99FF">
					<input type="text" name="cxhdje" size="8" maxlength="16"  value="<%=cxhdje%>" readonly style="BACKGROUND-COLOR:#CC99FF;border-color: #CC99FF #CC99FF #CC99FF #CC99FF;border-style:solid">			</td>
				<td bgcolor="#CC99FF"><%=sxbzmc%></td>
				<td bgcolor="#CC99FF"><%=sxhtyy%></td>
				<td >
					<A HREF="EditJc_zcddmxMain.jsp?ddbh=<%=ddbh%>&xh=<%=xh%>" target="_blank">�޸ĺ�ͬ</A>
				</td>
				<td >
					<input name="bz" type="text" value="<%=bz%>" size="67" maxlength="300" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
				<td bgcolor="#CC99FF"><%=zclbbm%></td>
				<td bgcolor="#CC99FF"><%=sfbhpj%></td>
				<td bgcolor="#CC99FF"><%=pjts%></td>
			</tr>
			<%

			row++;
		}

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
		<input type="button" value="����" onClick="f_do(editform)" >
		<input type="button" value='ȫѡ' onClick="f_checkAll(editform)" >
		<input type="button" value='ɾ����ѡ��Ŀ' onClick="f_delete(editform)" >
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

function f_jsjg(FormName,row)//����FormName:Form������
{
	if (<%=row%>==1)
	{
		var dj=FormName.dpzk.value/10.0*FormName.zqdj.value;
		dj=round(dj,2);
		FormName.dj.value=dj;

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
		var dj=FormName.dpzk[row].value/10.0*FormName.zqdj[row].value;
		dj=round(dj,2);
		FormName.dj[row].value=dj;

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

function f_do(FormName)//����FormName:Form������
{
	if (<%=row%>==1)
	{
		f_jsjg(FormName,1);

		if(	javaTrim(FormName.zqdj)=="") {
			alert("���ı���["+FormName.zcbm.value+"]����������[��ǰʵ������]��");
			FormName.zqdj.focus();
			return false;
		}
		if(!(isFloat(FormName.zqdj, "��ǰʵ������"))) {
			return false;
		}

		if(	javaTrim(FormName.dpzk)=="") {
			alert("���ı���["+FormName.zcbm.value+"]����������[�ۿ���]��");
			FormName.dpzk.focus();
			return false;
		}
		if(!(isFloat(FormName.dpzk, "�ۿ���"))) {
			return false;
		}
		if (FormName.dpzk.value<0 || FormName.dpzk.value>10)
		{
			alert("���ı���["+FormName.zcbm.value+"]����[�ۿ���]Ӧ����0��10֮�䣡");
			FormName.dpzk.select();
			return false;
		}

		if(	javaTrim(FormName.dj)=="") {
			alert("���ı���["+FormName.zcbm.value+"]����������[�ۺ�ʵ������]��");
			FormName.dj.focus();
			return false;
		}
		if(!(isFloat(FormName.dj, "�ۺ�ʵ������"))) {
			return false;
		}

		if(	javaTrim(FormName.sl)=="") {
			alert("���ı���["+FormName.zcbm.value+"]����������[��������]��");
			FormName.sl.focus();
			return false;
		}
		if(!(isFloat(FormName.sl, "��������"))) {
			return false;
		}
		if (parseFloat(FormName.sl.value)<=0)
		{
			alert("���ı���["+FormName.zcbm.value+"]����[��������]����<=0��");
			FormName.sl.select();
			return false;
		}

		if(	javaTrim(FormName.zqje)=="") {
			alert("���ı���["+FormName.zcbm.value+"]����������[��ǰ���Ϸ�]��");
			FormName.zqje.focus();
			return false;
		}
		if(!(isFloat(FormName.zqje, "��ǰ���Ϸ�"))) {
			return false;
		}
		if(	javaTrim(FormName.je)=="") {
			alert("���ı���["+FormName.zcbm.value+"]����������[�ۺ���Ϸ�]��");
			FormName.je.focus();
			return false;
		}
		if(!(isFloat(FormName.je, "�ۺ���Ϸ�"))) {
			return false;
		}

		if(!(isFloat(FormName.ycf, "Զ�̷�"))) {
			return false;
		}

		if(	javaTrim(FormName.qtfy)=="") 
		{
			alert("���ı���["+FormName.zcbm.value+"]������ѡ��[��������]��");
			FormName.qtfy.select();
			return false;
		}

		if (FormName.qtfy.value!="W")
		{
			if(	javaTrim(FormName.qtfyje)=="") {
				alert("���ı���["+FormName.zcbm.value+"]����������[�����ѽ��]��");
				FormName.qtfyje.focus();
				return false;
			}
			if(!(isFloat(FormName.qtfyje, "�����ѽ��"))) {
				return false;
			}
			if (FormName.qtfyje.value=="0")
			{
				alert("���ı���["+FormName.zcbm.value+"]����[�����ѽ��]����Ϊ0��");
				FormName.qtfyje.select();
				return false;
			}
		}
		else{
			if(	javaTrim(FormName.qtfyje)!="" && FormName.qtfyje.value!="0") 
			{
				alert("���ı���["+FormName.zcbm.value+"]����û����[������]��");
				FormName.qtfyje.select();
				return false;
			}
		}

		if (FormName.cxhdbz.value=="Y")
		{
			if(	javaTrim(FormName.cxhdbl)=="") {
				alert("���ı���["+FormName.zcbm.value+"]����������[������������]��");
				FormName.cxhdbl.focus();
				return false;
			}
			if(!(isFloat(FormName.cxhdbl, "������������"))) {
				return false;
			}
			if (FormName.cxhdbl.value<=0 || FormName.cxhdbl.value>100)
			{
				alert("���ı���["+FormName.zcbm.value+"]����[������������]Ӧ��0����100��֮�䣡");
				FormName.cxhdbl.select();
				return false;
			}
		}
		else{
			if(	javaTrim(FormName.cxhdbl)!="" && FormName.cxhdbl.value!="0") {
				alert("���ı���["+FormName.zcbm.value+"]�������μӴ������[������������]ӦΪ0��");
				FormName.cxhdbl.select();
				return false;
			}
			if(	javaTrim(FormName.cxhdje)!="" && FormName.cxhdje.value!="0") {
				alert("���ı���["+FormName.zcbm.value+"]�������μӴ������[�����������]ӦΪ0��");
				FormName.cxhdbl.select();
				return false;
			}
		}
		if(	javaTrim(FormName.sfzp)=="") {
			alert("���ı���["+FormName.zcbm.value+"]������ѡ��[�Ƿ���Ʒ]��");
			FormName.sfzp.focus();
			return false;
		}

		if (FormName.sfzp.value=="Y")
		{
			if (parseFloat(FormName.dj.value)!=0)
			{
				alert("������Ʒ���ۺ�ʵ�����ۡ�ӦΪ0");
				FormName.dj.select();
				return false;
			}
			if(	javaTrim(FormName.zsdj)=="") {
				alert("������[���͵���]��");
				FormName.zsdj.focus();
				return false;
			}
			if(!(isFloat(FormName.zsdj, "���͵���"))) {
				return false;
			}
			if (parseFloat(FormName.zsdj.value)==0)
			{
				alert("������Ʒ�����͵��ۡ�����Ϊ0");
				FormName.zsdj.select();
				return false;
			}
		}
		else{
			if (parseFloat(FormName.dj.value)==0)
			{
				alert("���󣡷���Ʒ���ۺ�ʵ�����ۡ�����Ϊ0");
				FormName.dj.select();
				return false;
			}

			if(	javaTrim(FormName.zsdj)=="") {
				alert("������[���͵���]��");
				FormName.zsdj.focus();
				return false;
			}
			if(!(isFloat(FormName.zsdj, "���͵���"))) {
				return false;
			}
			if (parseFloat(FormName.zsdj.value)!=0)
			{
				alert("���󣡷���Ʒ�����͵��ۡ�ӦΪ0");
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
				alert("���ı���["+FormName.zcbm[i].value+"]����������[��ǰʵ������]��");
				FormName.zqdj[i].focus();
				return false;
			}
			if(!(isFloat(FormName.zqdj[i], "��ǰʵ������"))) {
				return false;
			}

			if(	javaTrim(FormName.dpzk[i])=="") {
				alert("���ı���["+FormName.zcbm[i].value+"]����������[�ۿ���]��");
				FormName.dpzk[i].focus();
				return false;
			}
			if(!(isFloat(FormName.dpzk[i], "�ۿ���"))) {
				return false;
			}
			if (FormName.dpzk[i].value<0 || FormName.dpzk[i].value>10)
			{
				alert("���ı���["+FormName.zcbm[i].value+"]����[�ۿ���]Ӧ����0��10֮�䣡");
				FormName.dpzk[i].select();
				return false;
			}

			if(	javaTrim(FormName.dj[i])=="") {
				alert("���ı���["+FormName.zcbm[i].value+"]����������[�ۺ�ʵ������]��");
				FormName.dj[i].focus();
				return false;
			}
			if(!(isFloat(FormName.dj[i], "�ۺ�ʵ������"))) {
				return false;
			}

			if(	javaTrim(FormName.sl[i])=="") {
				alert("���ı���["+FormName.zcbm[i].value+"]����������[��������]��");
				FormName.sl[i].focus();
				return false;
			}
			if(!(isFloat(FormName.sl[i], "��������"))) {
				return false;
			}
			if (parseFloat(FormName.sl[i].value)<=0)
			{
				alert("���ı���["+FormName.zcbm[i].value+"]����[��������]����<=0��");
				FormName.sl[i].select();
				return false;
			}

			if(	javaTrim(FormName.zqje[i])=="") {
				alert("���ı���["+FormName.zcbm[i].value+"]����������[��ǰ���Ϸ�]��");
				FormName.zqje[i].focus();
				return false;
			}
			if(!(isFloat(FormName.zqje[i], "��ǰ���Ϸ�"))) {
				return false;
			}
			if(	javaTrim(FormName.je[i])=="") {
				alert("���ı���["+FormName.zcbm[i].value+"]����������[�ۺ���Ϸ�]��");
				FormName.je[i].focus();
				return false;
			}
			if(!(isFloat(FormName.je[i], "�ۺ���Ϸ�"))) {
				return false;
			}

			if(!(isFloat(FormName.ycf[i], "Զ�̷�"))) {
				return false;
			}

			if(	javaTrim(FormName.qtfy[i])=="") 
			{
				alert("���ı���["+FormName.zcbm[i].value+"]������ѡ��[��������]��");
				FormName.qtfy[i].select();
				return false;
			}

			if (FormName.qtfy[i].value!="W")
			{
				if(	javaTrim(FormName.qtfyje[i])=="") {
					alert("���ı���["+FormName.zcbm[i].value+"]����������[�����ѽ��]��");
					FormName.qtfyje[i].focus();
					return false;
				}
				if(!(isFloat(FormName.qtfyje[i], "�����ѽ��"))) {
					return false;
				}
				if (FormName.qtfyje[i].value=="0")
				{
					alert("���ı���["+FormName.zcbm[i].value+"]����[�����ѽ��]����Ϊ0��");
					FormName.qtfyje[i].select();
					return false;
				}
			}
			else{
				if(	javaTrim(FormName.qtfyje[i])!="" && FormName.qtfyje[i].value!="0") 
				{
					alert("���ı���["+FormName.zcbm[i].value+"]����û����[������]��");
					FormName.qtfyje[i].select();
					return false;
				}
			}

			if (FormName.cxhdbz[i].value=="Y")
			{
				if(	javaTrim(FormName.cxhdbl[i])=="") {
					alert("���ı���["+FormName.zcbm[i].value+"]����������[������������]��");
					FormName.cxhdbl.focus();
					return false;
				}
				if(!(isFloat(FormName.cxhdbl[i], "������������"))) {
					return false;
				}
				if (FormName.cxhdbl[i].value<=0 || FormName.cxhdbl[i].value>100)
				{
					alert("���ı���["+FormName.zcbm[i].value+"]����[������������]Ӧ��0����100��֮�䣡");
					FormName.cxhdbl[i].select();
					return false;
				}
			}
			else{
				if(	javaTrim(FormName.cxhdbl[i])!="" && FormName.cxhdbl[i].value!="0") {
					alert("���ı���["+FormName.zcbm[i].value+"]�������μӴ������[������������]ӦΪ0��");
					FormName.cxhdbl[i].select();
					return false;
				}
				if(	javaTrim(FormName.cxhdje[i])!="" && FormName.cxhdje[i].value!="0") {
					alert("���ı���["+FormName.zcbm[i].value+"]�������μӴ������[�����������]ӦΪ0��");
					FormName.cxhdbl[i].select();
					return false;
				}
			}
			if(	javaTrim(FormName.sfzp[i])=="") {
				alert("���ı���["+FormName.zcbm[i].value+"]������ѡ��[�Ƿ���Ʒ]��");
				FormName.sfzp[i].focus();
				return false;
			}

			if (FormName.sfzp[i].value=="Y")
			{
				if (parseFloat(FormName.dj[i].value)!=0)
				{
					alert("������Ʒ���ۺ�ʵ�����ۡ�ӦΪ0");
					FormName.dj[i].select();
					return false;
				}
				if(	javaTrim(FormName.zsdj[i])=="") {
					alert("������[���͵���]��");
					FormName.zsdj[i].focus();
					return false;
				}
				if(!(isFloat(FormName.zsdj[i], "���͵���"))) {
					return false;
				}
				if (parseFloat(FormName.zsdj[i].value)==0)
				{
					alert("������Ʒ�����͵��ۡ�����Ϊ0");
					FormName.zsdj[i].select();
					return false;
				}
			}
			else{
				if (parseFloat(FormName.dj[i].value)==0)
				{
					alert("���󣡷���Ʒ���ۺ�ʵ�����ۡ�����Ϊ0");
					FormName.dj[i].select();
					return false;
				}
				if(	javaTrim(FormName.zsdj[i])=="") {
					alert("������[���͵���]��");
					FormName.zsdj[i].focus();
					return false;
				}
				if(!(isFloat(FormName.zsdj[i], "���͵���"))) {
					return false;
				}
				if (parseFloat(FormName.zsdj[i].value)!=0)
				{
					alert("���󣡷���Ʒ�����͵��ۡ�ӦΪ0");
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
function f_checkAll(FormName)//ת���ַ���
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
	if ( confirm("ע�⣡ɾ���󲻿ɻָ���ȷʵҪɾ��������?") )	{
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
			alert("��ѡ��Ҫɾ��������");
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
