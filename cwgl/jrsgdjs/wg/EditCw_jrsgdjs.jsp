<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


String jsjlh=null;
String khbh=null;
String sgd=null;
String sgbz=null;
String jsrq=null;
String ysglk=null;
String zjsge=null;
String cfje=null;
String jsglk=null;
String rgfbfb=null;
String yfrgf=null;
String bcrgf=null;
String flkbfb=null;
String ycflk=null;
String bcflk=null;
String gsfl=null;
String psfl=null;
String kzbjbl=null;
String kzbj=null;
String fk=null;
String bx=null;
String pck=null;
String kqtk=null;
String kqtksm=null;
String bcfkhj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
double kjflk=0;
double rybx=0;

String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;
String zjxm=null;

String qyrq=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String gdjsjd=null;
String bjjb=null;
String bjjbmc=null;

int fwmj=0;

double yszccz=0;
double czbh=0;


String wherejsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select czbh,kjflk,rybx,jsjlh,khbh,sgd,sgbz,jsrq,ysglk,zjsge,cfje,jsglk,rgfbfb,yfrgf,bcrgf,flkbfb,ycflk,bcflk,gsfl,psfl,kzbjbl,kzbj,fk,bx,pck,kqtk,kqtksm,bcfkhj,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  cw_jrsgdjs";
	ls_sql+=" where  (jsjlh='"+wherejsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		czbh=rs.getDouble("czbh");
		kjflk=rs.getDouble("kjflk");
		rybx=rs.getDouble("rybx");
		jsjlh=cf.fillNull(rs.getString("jsjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		jsrq=cf.fillNull(rs.getDate("jsrq"));
		ysglk=cf.fillNull(rs.getString("ysglk"));
		zjsge=cf.fillNull(rs.getString("zjsge"));
		cfje=cf.fillNull(rs.getString("cfje"));
		jsglk=cf.fillNull(rs.getString("jsglk"));
		rgfbfb=cf.fillNull(rs.getString("rgfbfb"));
		yfrgf=cf.fillNull(rs.getString("yfrgf"));
		bcrgf=cf.fillNull(rs.getString("bcrgf"));
		flkbfb=cf.fillNull(rs.getString("flkbfb"));
		ycflk=cf.fillNull(rs.getString("ycflk"));
		bcflk=cf.fillNull(rs.getString("bcflk"));
		gsfl=cf.fillNull(rs.getString("gsfl"));
		psfl=cf.fillNull(rs.getString("psfl"));
		kzbjbl=cf.fillNull(rs.getString("kzbjbl"));
		kzbj=cf.fillNull(rs.getString("kzbj"));
		fk=cf.fillNull(rs.getString("fk"));
		bx=cf.fillNull(rs.getString("bx"));
		pck=cf.fillNull(rs.getString("pck"));
		kqtk=cf.fillNull(rs.getString("kqtk"));
		kqtksm=cf.fillNull(rs.getString("kqtksm"));
		bcfkhj=cf.fillNull(rs.getString("bcfkhj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select fwmj,gdjsjd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sgd,sgbz,zjxm";
	ls_sql+=" ,crm_khxx.bjjb,bjjbmc";
	ls_sql+=" from  crm_khxx,sq_dwxx,bdm_bjjbbm";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+) and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fwmj=rs.getInt("fwmj");
		bjjb=cf.fillNull(rs.getString("bjjb"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));

		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));

		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	ls_sql="select zccz";
	ls_sql+=" from cw_cflkjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yszccz=rs.getDouble("zccz");
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("<BR>����:" + e);
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

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE6 {color: #0000CC}
.STYLE8 {color: #CC0000; font-weight: bold; }
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�����¼��</td>
	<td  width="8%">Ԥ�㹤�Ͽ�</td>
	<td  width="5%">�˹��Ѱٷֱ�</td>
	<td  width="8%">�Ѹ��˹���</td>
	<td  width="8%">����Ӧ���˹���</td>
	<td  width="7%">����</td>
	<td  width="5%">����״̬</td>
	<td  width="5%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="40%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cw_jrbgf.jsjlh,TO_CHAR(cw_jrbgf.ysglk),cw_jrbgf.rgfbfb||'%',TO_CHAR(cw_jrbgf.yfrgf),cw_jrbgf.bcrgf,gdjsjdmc, DECODE(cw_jrbgf.clzt,'1','����','2','����ͬ��','3','������ͬ��'),cw_jrbgf.lrr,cw_jrbgf.lrsj,cw_jrbgf.bz ";
	ls_sql+=" FROM cw_jrbgf,dm_gdjsjd  ";
    ls_sql+=" where cw_jrbgf.lx=dm_gdjsjd.gdjsjd(+) and cw_jrbgf.khbh='"+khbh+"'";
	ls_sql+=" order by cw_jrbgf.jsjlh ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();

%>
</table>

<form method="post" action="SaveEditCw_jrsgdjs.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ����</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000FF">��ͬ��</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ�����</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">�ʼ�����</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ݵ�ַ</font></td>
    <td><%=fwdz%> </td>
    <td align="right">���ڽ������</td>
    <td><%=fwmj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ʩ����</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','���ѳ�����','N','')||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">ʩ������</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ʦ</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">ǩԼ����</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ǩԼ����</font></td>
    <td><%=qyrq%> </td>
    <td align="right"><span class="STYLE1">���ۼ���</span></td>
    <td><%=bjjbmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ʵ�ʿ�������</font></td>
    <td><%=sjkgrq%> </td>
    <td align="right"><font color="#0000FF">ʵ�ʿ�������</font></td>
    <td><%=sjjgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1"><font color="#FF0000">*</font></span><span class="STYLE2"><font color="#0000CC">�����¼��</font></span></td>
  <td width="32%"> 
    <input type="text" name="jsjlh" size="20" maxlength="9"  value="<%=jsjlh%>" readonly>  </td>
  <td align="right" width="18%"><font color="#0000CC">�ͻ����</font></td> 
  <td width="32%"> 
    <input type="text" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">ʩ����</font></span></td>
  <td width="32%"> 
    <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%>
    </select>  </td>
  <td align="right" width="18%"><font color="#0000CC">�ֳ�������</font></td> 
  <td width="32%"> 
    <input type="text" name="sgbz" size="20" maxlength="20"  value="<%=sgbz%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right"><font color="#FF0000">*</font><span class="STYLE6"><font color="#0000CC">Ԥ�㹤�Ͽ�</font></span></td>
  <td width="32%"><input type="text" name="ysglk" size="20" maxlength="17"  value="<%=ysglk%>" readonly></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right"><font color="#FF0000">*</font><span class="STYLE6"><font color="#0000CC">����ʩ����</font></span></td>
  <td width="32%"> 
    <input type="text" name="zjsge" size="20" maxlength="17"  value="<%=zjsge%>" readonly>  </td>
  <td align="right" width="18%"><font color="#0000CC">������</font></td> 
  <td width="32%"> 
    <input type="text" name="cfje" size="20" maxlength="17"  value="<%=cfje%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE6"><font color="#0000CC">���㹤�Ͽ�</font></span></td>
  <td width="32%"> 
    <input type="text" name="jsglk" size="20" maxlength="17"  value="<%=jsglk%>" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�˹��Ѱٷֱ�</td>
  <td><input type="text" name="rgfbfb" size="10" maxlength="9"  value="<%=rgfbfb%>" onChange="calValue(editform)">
%</td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE6">�Ѹ��˹���</span></td>
  <td><input type="text" name="yfrgf" size="20" maxlength="17"  value="<%=yfrgf%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">����Ӧ���˹���</span></td> 
  <td width="32%"><input type="text" name="bcrgf" size="20" maxlength="17"  value="<%=bcrgf%>" readonly></td>
  <td align="right" width="18%">�����ײ����ĳ�ֵ</td> 
  <td width="32%"><%=yszccz%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE8">����Ӧ���˹���=</span></td>
  <td colspan="3"><span class="STYLE8">���㹤�Ͽ�*�˹��Ѱٷֱ�-�Ѹ��˹���+������*0.23</span></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">���Ͽ�ٷֱ�</span></td> 
  <td width="32%"> 
    <input type="text" name="flkbfb" size="10" maxlength="9"  value="<%=flkbfb%>" readonly>
    % </td>
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">�ѳ帨�Ͽ�</span></td> 
  <td width="32%"> 
    <input type="text" name="ycflk" size="20" maxlength="17"  value="<%=ycflk%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">����Ӧ���˸��Ͽ�</span></td> 
  <td width="32%"> 
    <input type="text" name="bcflk" size="20" maxlength="17"  value="<%=bcflk%>" readonly>  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font>�ۼ����Ͽ�</td> 
  <td width="32%"><input type="text" name="kjflk" value="<%=kjflk%>" size="20" maxlength="17" onChange="calValue(editform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE8">����Ӧ���˸��Ͽ�=</span></td>
  <td colspan="3"><span class="STYLE8">(���㹤�Ͽ�-������)*���Ͽ�ٷֱ�+���*0.8-�ѳ帨�Ͽ�+�����ײ����ĳ�ֵ-�ۼ����Ͽ�</span></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>��˾����</td>
  <td><input type="text" name="gsfl" size="20" maxlength="17"  value="<%=gsfl%>" onChange="calValue(editform)"></td>
  <td align="right"><font color="#FF0000">*</font>���͸���</td>
  <td><input type="text" name="psfl" size="20" maxlength="17"  value="<%=psfl%>" onChange="calValue(editform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">���ʱ������</span></td> 
  <td colspan="3"><input type="text" name="kzbjbl" size="10" maxlength="9"  value="<%=kzbjbl%>" readonly>
    %
	<BR><span class="STYLE8">�ʱ���>=10�򣺿��ʱ������=0 <BR>
�ʱ���<10�򣬽��㹤�Ͽ�>=4�򣺿��ʱ������=5% <BR>
�ʱ���<10�򣬽��㹤�Ͽ�<4�򣺿��ʱ������=3% </span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE6">���ʱ���</span></td>
  <td colspan="3"><input type="text" name="kzbj" size="20" maxlength="17"  value="<%=kzbj%>" readonly>
    <span class="STYLE8">���ʱ���=���㹤�Ͽ�*���ʱ������</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>���ر���</td> 
  <td width="32%"><input type="text" name="bx" size="20" maxlength="17"  value="<%=bx%>" onChange="calValue(editform)"></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>��Ա����</td> 
  <td width="32%"><input type="text" name="rybx" value="<%=rybx%>" size="20" maxlength="17" onChange="calValue(editform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>�⳥��</td> 
  <td width="32%"><input type="text" name="pck" size="20" maxlength="17"  value="<%=pck%>" onChange="calValue(editform)"></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>����</td> 
  <td width="32%"><input type="text" name="fk" size="20" maxlength="17"  value="<%=fk%>" onChange="calValue(editform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>��������</td> 
  <td width="32%"> 
    <input type="text" name="kqtk" size="20" maxlength="17"  value="<%=kqtk%>" onChange="calValue(editform)">  </td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">��ש����</font></td>
  <td><input name="czbh" type="text" value="<%=czbh%>" size="20" maxlength="17" readonly>
      <strong>
      <input name="button" type="button" onClick=window.open("/khxx/Bj_zjxzcbgqdCzCxList.jsp?khbh=<%=khbh%>") value="��ש��ϸ">
    </strong></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������˵��</td>
  <td colspan="3"><input type="text" name="kqtksm" size="74" maxlength="200"  value="<%=kqtksm%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">���θ���ϼ�</span></td> 
  <td colspan="3"> 
    <input type="text" name="bcfkhj" size="20" maxlength="17"  value="<%=bcfkhj%>" readonly>
    <BR><span class="STYLE8">���θ���ϼ�=����Ӧ���˹���-��˾����-���͸���-���ʱ���-���ر���-��Ա����-�⳥��-����-��������-��ש����</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1"><font color="#FF0000">*</font></span><span class="STYLE2"><font color="#0000FF">¼����</font></span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000FF">¼��ʱ��</font></span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000FF">¼�벿��</font></span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right"><font color="#FF0000">*</font>��������</td>
  <td><input name="jsrq" type="text" id="jsrq"  value="<%=jsrq%>" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>    </td>
  </tr>
<input type="hidden" name="wherejsjlh"  value="<%=wherejsjlh%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function calValue(FormName)
{  
	var bcflk=0;
	bcflk=(FormName.jsglk.value*1.0-FormName.cfje.value*1.0)*FormName.flkbfb.value/100+<%=fwmj*0.8%>-FormName.ycflk.value*1.0+<%=yszccz%>-FormName.kjflk.value*1.0;
	FormName.bcflk.value=round(bcflk,0);

	var bcrgf=FormName.jsglk.value/100*FormName.rgfbfb.value+FormName.cfje.value*0.23-FormName.yfrgf.value;
	FormName.bcrgf.value=round(bcrgf,0);

	var bcfkhj=FormName.bcrgf.value*1.0-FormName.gsfl.value*1.0-FormName.psfl.value*1.0-FormName.kzbj.value*1.0-FormName.bx.value*1.0-FormName.rybx.value*1.0-FormName.fk.value*1.0-FormName.pck.value*1.0-FormName.kqtk.value*1.0-FormName.czbh.value*1.0;
	FormName.bcfkhj.value=round(bcfkhj,0);

//	���θ���ϼ�=����Ӧ���˹���-��˾����-���͸���-���ʱ���-���ر���-��Ա����-�⳥��-����-��������
	
} 

function f_do(FormName)//����FormName:Form������
{
	calValue(FormName);

	if(	javaTrim(FormName.jsjlh)=="") {
		alert("������[�����¼��]��");
		FormName.jsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("��ѡ��[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.jsrq)=="") {
		alert("������[��������]��");
		FormName.jsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jsrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.ysglk)=="") {
		alert("������[Ԥ�㹤�Ͽ�]��");
		FormName.ysglk.focus();
		return false;
	}
	if(!(isFloat(FormName.ysglk, "Ԥ�㹤�Ͽ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zjsge)=="") {
		alert("������[����ʩ����]��");
		FormName.zjsge.focus();
		return false;
	}
	if(!(isFloat(FormName.zjsge, "����ʩ����"))) {
		return false;
	}
	if(	javaTrim(FormName.cfje)=="") {
		alert("������[������]��");
		FormName.cfje.focus();
		return false;
	}
	if(!(isFloat(FormName.cfje, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.jsglk)=="") {
		alert("������[���㹤�Ͽ�]��");
		FormName.jsglk.focus();
		return false;
	}
	if(!(isFloat(FormName.jsglk, "���㹤�Ͽ�"))) {
		return false;
	}
	if(	javaTrim(FormName.rgfbfb)=="") {
		alert("������[�˹��Ѱٷֱ�]��");
		FormName.rgfbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.rgfbfb, "�˹��Ѱٷֱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yfrgf)=="") {
		alert("������[�Ѹ��˹���]��");
		FormName.yfrgf.focus();
		return false;
	}
	if(!(isFloat(FormName.yfrgf, "�Ѹ��˹���"))) {
		return false;
	}
	if(	javaTrim(FormName.kjflk)=="") {
		alert("������[�ۼ����Ͽ�]��");
		FormName.kjflk.focus();
		return false;
	}
	if(!(isFloat(FormName.kjflk, "�ۼ����Ͽ�"))) {
		return false;
	}
	if(	javaTrim(FormName.bcrgf)=="") {
		alert("������[����Ӧ���˹���]��");
		FormName.bcrgf.focus();
		return false;
	}
	if(!(isFloat(FormName.bcrgf, "����Ӧ���˹���"))) {
		return false;
	}
	if(	javaTrim(FormName.flkbfb)=="") {
		alert("������[���Ͽ�ٷֱ�]��");
		FormName.flkbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.flkbfb, "���Ͽ�ٷֱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.ycflk)=="") {
		alert("������[�ѳ帨�Ͽ�]��");
		FormName.ycflk.focus();
		return false;
	}
	if(!(isFloat(FormName.ycflk, "�ѳ帨�Ͽ�"))) {
		return false;
	}
	if(	javaTrim(FormName.bcflk)=="") {
		alert("������[����Ӧ���˸��Ͽ�]��");
		FormName.bcflk.focus();
		return false;
	}
	if(!(isFloat(FormName.bcflk, "����Ӧ���˸��Ͽ�"))) {
		return false;
	}
	if(	javaTrim(FormName.gsfl)=="") {
		alert("������[��˾����]��");
		FormName.gsfl.focus();
		return false;
	}
	if(!(isFloat(FormName.gsfl, "��˾����"))) {
		return false;
	}
	if(	javaTrim(FormName.psfl)=="") {
		alert("������[���͸���]��");
		FormName.psfl.focus();
		return false;
	}
	if(!(isFloat(FormName.psfl, "���͸���"))) {
		return false;
	}
	if(	javaTrim(FormName.kzbjbl)=="") {
		alert("������[���ʱ������]��");
		FormName.kzbjbl.focus();
		return false;
	}
	if(!(isFloat(FormName.kzbjbl, "���ʱ������"))) {
		return false;
	}
	if(	javaTrim(FormName.kzbj)=="") {
		alert("������[���ʱ���]��");
		FormName.kzbj.focus();
		return false;
	}
	if(!(isFloat(FormName.kzbj, "���ʱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.fk)=="") {
		alert("������[����]��");
		FormName.fk.focus();
		return false;
	}
	if(!(isFloat(FormName.fk, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.bx)=="") {
		alert("������[���ر���]��");
		FormName.bx.focus();
		return false;
	}
	if(!(isFloat(FormName.bx, "���ر���"))) {
		return false;
	}
	if(	javaTrim(FormName.rybx)=="") {
		alert("������[��Ա����]��");
		FormName.rybx.focus();
		return false;
	}
	if(!(isFloat(FormName.rybx, "��Ա����"))) {
		return false;
	}
	if(	javaTrim(FormName.pck)=="") {
		alert("������[�⳥��]��");
		FormName.pck.focus();
		return false;
	}
	if(!(isFloat(FormName.pck, "�⳥��"))) {
		return false;
	}
	if(	javaTrim(FormName.kqtk)=="") {
		alert("������[��������]��");
		FormName.kqtk.focus();
		return false;
	}
	if(!(isFloat(FormName.kqtk, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.bcfkhj)=="") {
		alert("������[���θ���ϼ�]��");
		FormName.bcfkhj.focus();
		return false;
	}
	if(!(isFloat(FormName.bcfkhj, "���θ���ϼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.czbh)=="") {
		alert("������[��ש����]��");
		FormName.czbh.focus();
		return false;
	}
	if(!(isFloat(FormName.czbh, "��ש����"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
