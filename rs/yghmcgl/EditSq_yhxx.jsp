<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

String bianhao=null;
String yhmc=null;
String xb=null;
String csrq=null;
String sfzszg=null;
String mz=null;
String sg=null;
String tz=null;
String xx=null;
String hf=null;
String zzmm=null;
String sjsjb=null;
String zcmc=null;
String zyzzzs=null;
String xlbm=null;
String zy=null;
String cjgzsj=null;
String xuewei=null;
String byyx=null;
String zz=null;
String yzbm=null;
String dh=null;
String bgdh=null;
String jtdh=null;
String email=null;
String sfzh=null;
String sfzdz=null;
String gznx=null;
String jjlxr=null;
String jjlxrdz=null;
String lxrdh=null;
String zwbm=null;
String xzzwbm=null;
String sfytj=null;
String tjrq=null;
String sfqs=null;
String dhsfgb=null;
String zwpj=null;
String ssfgs=null;
String dwbh=null;
String lrr=null;
String lrsj=null;
String bz=null;
String sfydbs=null;
String qgzdw=null;
String wgzsj=null;
String syjzrq=null;
String kqhm=null;
String hjszd=null;
String dacfd=null;
String dazrsj=null;
String dazcsj=null;
String dazchc=null;
String dabgfjs=null;
String sjsbh=null;
String rzcs=null;
String rzsj=null;
String gqpxkssj=null;
String gqpxjssj=null;
String xuhao=null;

String whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	
	ls_sql="select xuhao,bianhao,yhmc,xb,csrq,sfzszg,mz,sg,tz,xx,hf,zzmm,sjsjb,zcmc,zyzzzs,xlbm,zy,cjgzsj,xuewei,byyx,zz,yzbm,dh,bgdh,jtdh,email,sfzh,sfzdz,gznx,jjlxr,jjlxrdz,lxrdh,zwbm,xzzwbm,sfytj,tjrq,sfqs,dhsfgb,zwpj,ssfgs,dwbh,lrr,lrsj,bz,sfydbs,qgzdw,wgzsj,syjzrq,kqhm,hjszd,dacfd,dazrsj,dazcsj,dazchc,dabgfjs,sjsbh,rzcs,rzsj,gqpxkssj,gqpxjssj ";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where  (ygbh="+whereygbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xuhao=cf.fillNull(rs.getString("xuhao"));

		bianhao=cf.fillNull(rs.getString("bianhao"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		xb=cf.fillNull(rs.getString("xb"));
		csrq=cf.fillNull(rs.getDate("csrq"));
		sfzszg=cf.fillNull(rs.getString("sfzszg"));
		mz=cf.fillNull(rs.getString("mz"));
		sg=cf.fillNull(rs.getString("sg"));
		tz=cf.fillNull(rs.getString("tz"));
		xx=cf.fillNull(rs.getString("xx"));
		hf=cf.fillNull(rs.getString("hf"));
		zzmm=cf.fillNull(rs.getString("zzmm"));
		sjsjb=cf.fillNull(rs.getString("sjsjb"));
		zcmc=cf.fillNull(rs.getString("zcmc"));
		zyzzzs=cf.fillNull(rs.getString("zyzzzs"));
		xlbm=cf.fillNull(rs.getString("xlbm"));
		zy=cf.fillNull(rs.getString("zy"));
		cjgzsj=cf.fillNull(rs.getDate("cjgzsj"));
		xuewei=cf.fillNull(rs.getString("xuewei"));
		byyx=cf.fillNull(rs.getString("byyx"));
		zz=cf.fillNull(rs.getString("zz"));
		yzbm=cf.fillNull(rs.getString("yzbm"));
		dh=cf.fillNull(rs.getString("dh"));
		bgdh=cf.fillNull(rs.getString("bgdh"));
		jtdh=cf.fillNull(rs.getString("jtdh"));
		email=cf.fillNull(rs.getString("email"));
		sfzh=cf.fillNull(rs.getString("sfzh"));
		sfzdz=cf.fillNull(rs.getString("sfzdz"));
		gznx=cf.fillNull(rs.getString("gznx"));
		jjlxr=cf.fillNull(rs.getString("jjlxr"));
		jjlxrdz=cf.fillNull(rs.getString("jjlxrdz"));
		lxrdh=cf.fillNull(rs.getString("lxrdh"));
		zwbm=cf.fillNull(rs.getString("zwbm"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		sfytj=cf.fillNull(rs.getString("sfytj"));
		tjrq=cf.fillNull(rs.getDate("tjrq"));
		sfqs=cf.fillNull(rs.getString("sfqs"));
		dhsfgb=cf.fillNull(rs.getString("dhsfgb"));
		zwpj=cf.fillNull(rs.getString("zwpj"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		sfydbs=cf.fillNull(rs.getString("sfydbs"));
		qgzdw=cf.fillNull(rs.getString("qgzdw"));
		wgzsj=cf.fillNull(rs.getString("wgzsj"));
		syjzrq=cf.fillNull(rs.getDate("syjzrq"));
		kqhm=cf.fillNull(rs.getString("kqhm"));
		hjszd=cf.fillNull(rs.getString("hjszd"));
		dacfd=cf.fillNull(rs.getString("dacfd"));
		dazrsj=cf.fillNull(rs.getDate("dazrsj"));
		dazcsj=cf.fillNull(rs.getDate("dazcsj"));
		dazchc=cf.fillNull(rs.getString("dazchc"));
		dabgfjs=cf.fillNull(rs.getString("dabgfjs"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		rzcs=cf.fillNull(rs.getString("rzcs"));
		rzsj=cf.fillNull(rs.getDate("rzsj"));
		gqpxkssj=cf.fillNull(rs.getDate("gqpxkssj"));
		gqpxjssj=cf.fillNull(rs.getDate("gqpxjssj"));
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

<html>
<head>
<title>�޸�Ա���ǼǱ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditSq_yhxx.jsp" name="editform" target="_blank">
<div align="center">�޸�Ա���ǼǱ�</div>
<div align="center">
  <input type="button" value="¼���������" onClick="window.open('InsertRs_jyjl.jsp?ygbh=<%=whereygbh%>')">
  <input type="button" value="¼�빤������" onClick="window.open('InsertRs_gzjl.jsp?ygbh=<%=whereygbh%>')">
  <input type="button" value="¼���ͥ����" onClick="window.open('InsertRs_jtzl.jsp?ygbh=<%=whereygbh%>')">
    <input type="button"  value="�ϴ���Ƭ" onClick="window.open('loadPhoto.jsp?ygbh=<%=whereygbh%>')">
    <input type="button"  value="�鿴��Ƭ" onClick="window.open('viewPhoto.jsp?ygbh=<%=whereygbh%>')">
    <input name="button2" type="button" onClick="f_do(editform)"  value="����">
    <input name="reset2" type="reset"  value="����">
  </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%"><font color=#0000ff>����</font></td>
      <td width="15%"> 
        <input type="text" name="yhmc" size="15" maxlength="50"  value="<%=yhmc%>" readonly>      </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>�Ա�</td>
      <td width="15%"> 
        <select name="xb" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"M+��&W+Ů",xb);
%> 
        </select>      </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>��������</td>
      <td width="15%"> 
        <input type="text" name="csrq" size="15" maxlength="10"  value="<%=csrq%>" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="10%"><span class="STYLE1">*</span>Ա��״̬ </td>
      <td width="15%"> 
        <select name="sfzszg" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"M+ʵϰ��&Y+ת��&N+������&D+����&S+��ְ&T+����",sfzszg);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">����</td>
      <td width="15%"> 
        <input type="text" name="mz" size="15" maxlength="20"  value="<%=mz%>" >      </td>
      <td align="right" width="15%">���(cm)</td>
      <td width="15%"> 
        <input type="text" name="sg" size="15" maxlength="8"  value="<%=sg%>" >      </td>
      <td align="right" width="15%">����(KG)</td>
      <td width="15%"> 
        <input type="text" name="tz" size="15" maxlength="8"  value="<%=tz%>" >      </td>
      <td align="right" width="10%">Ѫ��</td>
      <td width="15%"> 
        <select name="xx" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"1+A��&2+B��&3+AB��&4+O��",xx);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">����״��</td>
      <td width="15%"> 
        <select name="hf" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"Y+��&N+��",hf);
%> 
        </select>      </td>
      <td align="right" width="15%">������ò</td>
      <td width="15%"> 
        <select name="zzmm" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"0+Ⱥ��&1+�й���Ա&2+������Ա&3+��������",zzmm);
%> 
        </select>      </td>
      <td align="right" width="15%">����ְ��</td>
      <td width="15%"> 
        <select name="zcmc" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select zcmc c1,zcmc c2 from dm_zcbm order by zcmc",zcmc);
%> 
        </select>      </td>
      <td align="right" width="10%">��Ҫ����֤��</td>
      <td width="15%"> 
        <select name="zyzzzs" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select zzzs c1,zzzs c2 from dm_zzzs order by zzzs",zyzzzs);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%"><span class="STYLE1">*</span>�Ļ��̶�</td>
      <td width="15%"> 
        <select name="xlbm" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xlbm,xueli from dm_xlbm order by xlbm",xlbm);
%> 
        </select>      </td>
      <td align="right" width="15%">��ѧרҵ</td>
      <td width="15%"> 
        <input type="text" name="zy" size="15" maxlength="50"  value="<%=zy%>" >      </td>
      <td align="right" width="15%">��ҵʱ��</td>
      <td width="15%"> 
        <input type="text" name="cjgzsj" size="15" maxlength="10"  value="<%=cjgzsj%>" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="10%">ѧλ</td>
      <td width="15%"> 
        <select name="xuewei" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"1+ѧʿѧλ&2+˶ʿѧλ&3+��ʿѧλ",xuewei);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">��ҵԺУ</td>
      <td width="15%" colspan="3"> 
        <input type="text" name="byyx" size="50" maxlength="50"  value="<%=byyx%>" >      </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>�Ƿ������</td>
      <td width="15%"><%
	cf.radioToken(out, "sfytj","Y+��&N+��",sfytj);
%></td>
      <td align="right" width="10%">�������</td>
      <td width="15%"> 
        <input type="text" name="tjrq" size="15" maxlength="10"  value="<%=tjrq%>" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">����ϸסַ</td>
      <td width="15%" colspan="3"> 
        <input type="text" name="zz" size="50" maxlength="200"  value="<%=zz%>" >      </td>
      <td align="right" width="15%">��������</td>
      <td width="15%"> 
        <input type="text" name="yzbm" size="15" maxlength="10"  value="<%=yzbm%>" >      </td>
      <td align="right" width="10%">email</td>
      <td width="15%"> 
        <input type="text" name="email" size="15" maxlength="50"  value="<%=email%>" >      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">�ֻ�</td>
      <td width="15%"> 
        <input type="text" name="dh" size="15" maxlength="50"  value="<%=dh%>" >      </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>�칫�绰</td>
      <td width="15%"> 
        <input type="text" name="bgdh" size="15" maxlength="50"  value="<%=bgdh%>" >      </td>
      <td align="right" width="15%">��ͥ�绰</td>
      <td width="15%"> 
        <input type="text" name="jtdh" size="15" maxlength="50"  value="<%=jtdh%>" >      </td>
      <td align="right" width="10%"><span class="STYLE1">*</span>�绰�Ƿ񹫲�</td>
      <td width="15%"> 
        <select name="dhsfgb" style="FONT-SIZE:12PX;WIDTH:114PX">
          <%
	cf.selectToken(out,"1+����˾&2+������&9+������",dhsfgb);
	%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%"><span class="STYLE1">*</span>���֤��</td>
      <td width="15%"> 
        <input type="text" name="sfzh" size="15" maxlength="18"  value="<%=sfzh%>" >      </td>
      <td align="right" width="15%">���֤��ַ</td>
      <td width="15%" colspan="3"> 
        <input type="text" name="sfzdz" size="50" maxlength="100"  value="<%=sfzdz%>" >      </td>
      <td align="right" width="10%">����</td>
      <td width="15%"> 
        <input type="text" name="bianhao" size="15" maxlength="20"  value="<%=bianhao%>" >      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">������ϵ��</td>
      <td width="15%"> 
        <input type="text" name="jjlxr" size="15" maxlength="20"  value="<%=jjlxr%>" >      </td>
      <td align="right" width="15%">������ϵ��סַ</td>
      <td width="15%" colspan="3"> 
        <input type="text" name="jjlxrdz" size="50" maxlength="100"  value="<%=jjlxrdz%>" >      </td>
      <td align="right" width="10%">������ϵ�˵绰</td>
      <td width="15%"> 
        <input type="text" name="lxrdh" size="15" maxlength="50"  value="<%=lxrdh%>" >      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%">�Ƿ�ȹ����ϵ</td>
      <td width="15%"><%
	cf.radioToken(out, "sfqs","Y+��&N+��",sfqs);
%> </td>
      <td align="right" width="15%">���</td>
      <td width="15%"><input name="xuhao" type="text" value="<%=xuhao%>" size="15" maxlength="8" ></td>
      <td align="right" width="15%">���ں���</td>
      <td width="15%"> 
        <input type="text" name="kqhm" size="15" maxlength="8"  value="<%=kqhm%>" >      </td>
      <td align="right" width="10%">���ʦְ��</td>
      <td width="15%"> 
        <select name="sjsjb" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select sjsjb,sjsjbmc from rs_sjsjb order by sjsjb",sjsjb);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#E0F5FF"> 
      <td align="right" width="10%" bgcolor="#E0F5FF">ҵ��ר��<BR>
        ��������</td>
      <td colspan="7"> 
        <textarea name="zwpj" cols="118" rows="3"><%=zwpj%></textarea>      </td>
    </tr>
    <tr bgcolor="#DFE3E9" align="center"> 
      <td colspan="8"><b>*�����������*</b></td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%"><span class="STYLE1">*</span>�������ڵ�</td>
      <td width="15%" colspan="3"> 
        <input type="text" name="hjszd" size="50" maxlength="100"  value="<%=hjszd%>" >      </td>
      <td align="right" width="15%">������ŵ�</td>
      <td colspan="3"> 
        <input type="text" name="dacfd" size="50" maxlength="50"  value="<%=dacfd%>" >      </td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%">����ת��ʱ��</td>
      <td width="15%"> 
        <input type="text" name="dazrsj" size="15" maxlength="10"  value="<%=dazrsj%>" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="15%">����ת��ʱ��</td>
      <td width="15%"> 
        <input type="text" name="dazcsj" size="15" maxlength="10"  value="<%=dazcsj%>" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="15%">����ת���δ�</td>
      <td width="15%"> 
        <input type="text" name="dazchc" size="15" maxlength="50"  value="<%=dazchc%>">      </td>
      <td align="right" width="10%">�������ܷѽ���</td>
      <td width="15%"><%
	cf.radioToken(out, "dabgfjs","N+δ����&Y+����",dabgfjs);
%></td>
    </tr>
    <tr bgcolor="#DFE3E9" align="center"> 
      <td colspan="8"><b>*��ְ*</b></td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%"><span class="STYLE1">*</span>������˾</td>
      <td width="15%">
        <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:114PX" onChange="changeFgs(editform)">
<%
	if (kfgssq.equals("2"))//2����Ȩ����ֹ�˾
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh",ssfgs);
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
	}
%> 
        </select></td>
      <td align="right" width="15%"><span class="STYLE1">*</span>��������</td>
      <td width="15%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:114PX" onChange="changeDwbh(editform)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh",dwbh);
%> 
        </select>      </td>
      <td align="right" width="15%">��������С��</td>
      <td width="15%"> 
        <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:114PX">
          <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssdw='"+dwbh+"' and dwlx in('F3','F4') and  cxbz='N'",sjsbh);
		%> 
        </select>      </td>
      <td align="right" width="10%"><span class="STYLE1">*</span>����ְ��</td>
      <td width="15%"> 
        <select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:114PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc",xzzwbm);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%"><span class="STYLE1">*</span>��ְ����</td>
      <td width="15%"> 
        <input type="text" name="rzsj" size="15" maxlength="10"  value="<%=rzsj%>" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>��ְ����</td>
      <td width="15%"> 
        <input type="text" name="rzcs" size="15" maxlength="8"  value="<%=rzcs%>" >      </td>
      <td align="right" width="15%">���ý�������</td>
      <td width="15%"> 
        <input type="text" name="syjzrq" size="15" maxlength="10"  value="<%=syjzrq%>" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="10%">��������</td>
      <td width="15%"> 
        <input type="text" name="gznx" size="12" maxlength="8"  value="<%=gznx%>" >
        �� </td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%">δ����ʱ��</td>
      <td width="15%"> 
        <input type="text" name="wgzsj" size="12" maxlength="9"  value="<%=wgzsj%>" >
        �� </td>
      <td align="right" width="15%"><span class="STYLE1">*</span>�Ƿ��е�����</td>
      <td width="15%"><%
	cf.radioToken(out, "sfydbs","Y+��&N+��",sfydbs);
%></td>
      <td align="right" width="15%">��ǰ��ѵ ��</td>
      <td width="15%"> 
        <input type="text" name="gqpxkssj" size="15" maxlength="10"  value="<%=gqpxkssj%>" onDblClick="JSCalendar(this)">      </td>
      <td align="right" width="10%">��ǰ��ѵ ��</td>
      <td width="15%"> 
        <input type="text" name="gqpxjssj" size="15" maxlength="10"  value="<%=gqpxjssj%>" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%">ǰ������λ</td>
      <td colspan="7"> 
        <input type="text" name="qgzdw" size="120" maxlength="100"  value="<%=qgzdw%>" >      </td>
    </tr>
    <tr bgcolor="#DFE3E9" align="center"> 
      <td colspan="8">&nbsp;</td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td>
      <td width="15%"><input type="text" name="lrr" size="15" maxlength="20"  value="<%=lrr%>" readonly></td>
      <td align="right" width="15%"><span class="STYLE2"><span class="STYLE1">*</span>¼��ʱ��</span></td>
      <td width="15%"><input type="text" name="lrsj" size="15" maxlength="10"  value="<%=lrsj%>" readonly></td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="15%">&nbsp;</td>
      <td align="right" width="10%">&nbsp;</td>
      <td width="15%">&nbsp;</td>
    </tr>
    <tr bgcolor="#DFE3E9"> 
      <td align="right" width="10%">��ע</td>
      <td colspan="7"><b>
        <textarea name="bz" cols="119" rows="2"><%=bz%></textarea>
      </b> </td>
    </tr>
    
    
    <input type="hidden" name="whereygbh"  value="<%=whereygbh%>" >
    <tr> 
      <td colspan="8" height="2"> 
        <div align="center"> 
          <input type="button" value="¼���������" onClick="window.open('InsertRs_jyjl.jsp?ygbh=<%=whereygbh%>')" >
          <input type="button" value="¼�빤������" onClick="window.open('InsertRs_gzjl.jsp?ygbh=<%=whereygbh%>')" >
          <input type="button" value="¼���ͥ����" onClick="window.open('InsertRs_jtzl.jsp?ygbh=<%=whereygbh%>')" >
          <input type="button"  value="�ϴ���Ƭ" onClick="window.open('loadPhoto.jsp?ygbh=<%=whereygbh%>')" >
          <input type="button"  value="�鿴��Ƭ" onClick="window.open('viewPhoto.jsp?ygbh=<%=whereygbh%>')" >
          <input name="button" type="button" onClick="f_do(editform)"  value="����">
          <input name="reset" type="reset"  value="����">
        </div>      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	//����Ajax
	cf.ajax(out);
%>

var czlx;

function changeFgs(FormName)
{
	czlx=1;

	FormName.dwbh.length=1;
	FormName.sjsbh.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	var sql="select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by dwbh";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function changeDwbh(FormName)
{
	czlx=2;

	FormName.sjsbh.length=1;

	if (FormName.dwbh.value=="")
	{
		return;
	}

	var sql="select dwbh,dwmc from sq_dwxx where dwlx in('F3','F4') and  cxbz='N' and ssdw='"+FormName.dwbh.value+"' order by dwbh";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (czlx==1)
	{
		strToSelect(editform.dwbh,ajaxRetStr);
	}
	else if (czlx==2)
	{
		strToSelect(editform.sjsbh,ajaxRetStr);
	}
}

function f_do(FormName)//����FormName:Form������
{

	if(	javaTrim(FormName.yhmc)=="") {
		alert("������[Ա������]��");
		FormName.yhmc.focus();
		return false;
	}
	if(	javaTrim(FormName.xb)=="") {
		alert("��ѡ��[�Ա�]��");
		FormName.xb.focus();
		return false;
	}
	if(	javaTrim(FormName.csrq)=="") {
		alert("������[��������]��");
		FormName.csrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.csrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.sfzszg)=="") {
		alert("��ѡ��[Ա��״̬ ]��");
		FormName.sfzszg.focus();
		return false;
	}
	if(!(isNumber(FormName.sg, "���(cm)"))) {
		return false;
	}
	if(!(isNumber(FormName.tz, "����(KG)"))) {
		return false;
	}
	if(!(isDatetime(FormName.cjgzsj, "��ҵʱ��"))) {
		return false;
	}
//	if(	javaTrim(FormName.dh)=="") {
//		alert("������[�ֻ�]��");
//		FormName.dh.focus();
//		return false;
//	}
	if(	javaTrim(FormName.bgdh)=="") {
		alert("������[�칫�绰]��");
		FormName.bgdh.focus();
		return false;
	}
	if(	javaTrim(FormName.sfzh)=="") {
		alert("������[���֤��]��");
		FormName.sfzh.focus();
		return false;
	}
	if(FormName.sfzh.value.length!=15 && FormName.sfzh.value.length!=18) 
	{
		alert("[���֤]����ֻ����15λ��18λ");
		FormName.sfzh.focus();
		return false;
	}
//	if(	javaTrim(FormName.jjlxr)=="") {
//		alert("������[������ϵ��]��");
//		FormName.jjlxr.focus();
//		return false;
//	}
//	if(	javaTrim(FormName.lxrdh)=="") {
//		alert("������[������ϵ�˵绰]��");
//		FormName.lxrdh.focus();
//		return false;
//	}
	if(	!radioChecked(FormName.sfytj)) {
		alert("��ѡ��[�Ƿ������]��");
		FormName.sfytj[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.tjrq, "�������"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfqs)) {
		alert("��ѡ��[�Ƿ��빫˾��������������ϵ]��");
		FormName.sfqs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.dhsfgb)=="") {
		alert("������[�绰�Ƿ񹫲�]��");
		FormName.dhsfgb.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[������˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[��������]��");
		FormName.dwbh.focus();
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
	if(	!radioChecked(FormName.sfydbs)) {
		alert("��ѡ��[�Ƿ��е�����]��");
		FormName.sfydbs[0].focus();
		return false;
	}
//	if(	javaTrim(FormName.wgzsj)=="") {
//		alert("������[δ����ʱ��(��)]��");
//		FormName.wgzsj.focus();
//		return false;
//	}
	if(!(isFloat(FormName.wgzsj, "δ����ʱ��(��)"))) {
		return false;
	}

	if (FormName.sfzszg.value=="N")
	{
		if(	javaTrim(FormName.syjzrq)=="") {
			alert("������[���ý�������]��");
			FormName.syjzrq.focus();
			return false;
		}

		if(!(isDatetime(FormName.syjzrq, "���ý�������"))) {
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.syjzrq)!="") {
			alert("������Ա��������¼��[���ý�������]��");
			FormName.syjzrq.select();
			return false;
		}
	}

	if(	javaTrim(FormName.hjszd)=="") {
		alert("������[�������ڵ�]��");
		FormName.hjszd.focus();
		return false;
	}
//	if(	javaTrim(FormName.dacfd)=="") {
//		alert("������[������ŵ�]��");
//		FormName.dacfd.focus();
//		return false;
//	}
	if(!(isDatetime(FormName.dazrsj, "����ת��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.dazcsj, "����ת��ʱ��"))) {
		return false;
	}

	if(	javaTrim(FormName.rzcs)=="") {
		alert("������[��ְ����]��");
		FormName.rzcs.focus();
		return false;
	}
	if(!(isNumber(FormName.rzcs, "��ְ����"))) {
		return false;
	}
	if(	javaTrim(FormName.rzsj)=="") {
		alert("������[��ְ����]��");
		FormName.rzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.rzsj, "��ְ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.gqpxkssj, "��ǰ��ѵ��ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gqpxjssj, "��ǰ��ѵ����ʱ��"))) {
		return false;
	}

	if(!(isInt(FormName.xuhao, "���"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>

