<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�޸�����</title>
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
      <div align="center">�޸�ľ�ź�ͬ��ϸ��<font color="#FF6699">ע�⣺Ӱ�쵽�۸񲿷֣�[��/������]����[�زĺ�]</font>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_mmdgdmx.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">Ԥ�������</div>
              </td>
              <td width="28%"> 
                <input type="hidden" name="wherexh"  value="<%=wherexh%>" >
                <input type="text" name="yddbh" value="<%=yddbh%>" size="20" maxlength="9" readonly>
              </td>
              <td width="20%"> 
                <div align="right">��������</div>
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
                <div align="right">������</div>
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
                <div align="right">��ɫ</div>
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
              <td width="22%" bgcolor="#FFCCFF" align="right">ľ���ͺ�</td>
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
                <div align="right">����</div>
              </td>
              <td colspan="3" bgcolor="#FFCCFF"> 
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:452PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
		if (jjfs.equals("11"))//11��ľ��
		{
			cf.selectItem(out,"select distinct jc_mmbjb.ysbm,mmczmc from  jc_mmbjb,jdm_mmczbm where jc_mmbjb.dqbm='"+dqbm+"' and jc_mmbjb.mmxh='"+mmxh+"' and jc_mmbjb.ysbm=jdm_mmczbm.mmczbm order by mmczmc",ysbm);
		}
		//12��˫���ƿڣ�13��˫�ڴ��ף�14�������ƿڣ�15�����ڴ���
		else if (jjfs.equals("12") || jjfs.equals("13") || jjfs.equals("14") || jjfs.equals("15"))
		{
			cf.selectItem(out,"select distinct jc_mtbjb.ysbm,mmczmc from  jc_mtbjb,jdm_mmczbm where jc_mtbjb.dqbm='"+dqbm+"' and jc_mtbjb.mmdglxbm='"+mmdglxbm+"' and jc_mtbjb.ysbm=jdm_mmczbm.mmczbm order by mmczmc",ysbm);
		}
		//21��������
		else if (jjfs.equals("21"))
		{
			cf.selectItem(out,"select distinct jc_mlcbjb.ysbm,mmczmc from  jc_mlcbjb,jdm_mmczbm where jc_mlcbjb.dqbm='"+dqbm+"' and jc_mlcbjb.mmdglxbm='"+mmdglxbm+"' and jc_mlcbjb.ysbm=jdm_mmczbm.mmczbm  order by mmczmc",ysbm);
		}
		//22���Ŷ���
		else if (jjfs.equals("22"))
		{
			cf.selectItem(out,"select distinct jc_mlcbjb.ysbm,mmczmc from  jc_mlcbjb,jdm_mmczbm where jc_mlcbjb.dqbm='"+dqbm+"' and jc_mlcbjb.mmdglxbm='"+mmdglxbm+"' and jc_mlcbjb.ysbm=jdm_mmczbm.mmczbm  order by mmczmc",ysbm);
		}
		//31����Ʈ������
		else if (jjfs.equals("31"))
		{
			cf.selectItem(out,"select distinct jc_mtbjb.ysbm,mmczmc from  jc_mtbjb,jdm_mmczbm where jc_mtbjb.dqbm='"+dqbm+"' and jc_mtbjb.mmdglxbm='"+mmdglxbm+"' and jc_mtbjb.ysbm=jdm_mmczbm.mmczbm order by mmczmc",ysbm);
		}
		//32����Ʈ��ƽ̨�Ͽ�
		else if (jjfs.equals("32"))
		{
			cf.selectItem(out,"select distinct jc_tjxbjb.ysbm,mmczmc from  jc_tjxbjb,jdm_mmczbm where jc_tjxbjb.dqbm='"+dqbm+"' and jc_tjxbjb.mmdglxbm='"+mmdglxbm+"' and jc_tjxbjb.ysbm=jdm_mmczbm.mmczbm order by mmczmc",ysbm);
		}
		//41��ƽ���׼Ƽ�;42�����׼Ƽ�
		else if (jjfs.equals("41") || jjfs.equals("42"))
		{
			cf.selectItem(out,"select distinct jc_tjxbjb.ysbm,mmczmc from  jc_tjxbjb,jdm_mmczbm where jc_tjxbjb.dqbm='"+dqbm+"' and jc_tjxbjb.mmdglxbm='"+mmdglxbm+"' and jc_tjxbjb.ysbm=jdm_mmczbm.mmczbm order by mmczmc",ysbm);
		}
		//43���ֶ�ƽ���׼Ƽۣ�44���ֶ����׼Ƽۣ�45���ֶΰ����ȼƼ�
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
                <div align="right">��װλ��</div>
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
                <div align="right">��������</div>
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
              <td width="22%" align="right">����,�ƿ�,���ף�������</td>
              <td width="28%">
                <select name="mtxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mtxbm,mtxmc from jdm_mtxbm order by mtxbm",mtxbm);
%> 
                </select>
              </td>
              <td width="20%" align="right">����,�ƿ�,���ף���о��</td>
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
              <td width="22%" align="right">�ز�����</td>
              <td width="28%"> 
                <select name="dczlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJg(dczlbm,dbh);getDj(insertform);">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dczlbm,dczlmc||'�����:'||dzhd from jdm_dczlbm order by dczlbm",dczlbm);
%> 
                </select>
              </td>
              <td width="20%" align="right">�����ͺ�</td>
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
              <td width="22%" align="right" bgcolor="#FFCCFF">��/��/ƽ̨�Ͽ�/����ǽ��</td>
              <td width="28%" bgcolor="#FFCCFF"> 
                <input type="text" name="qh" value="<%=qh%>" size="14" maxlength="8"  onChange="getDj(insertform)">
                ��mm�� </td>
              <td width="20%" align="right" bgcolor="#FFFFFF">�زĺ�</td>
              <td width="30%"> 
                <input type="text" name="dbh" value="<%=dbh%>" size="14" maxlength="8"  onChange="getDj(insertform)" >
                ��mm�� </td>
            </tr>
            <tr bgcolor="#FFCCFF"> 
              <td width="22%"> 
                <div align="right">��/��/ƽ̨�Ͽ�/���ǿ�</div>
              </td>
              <td width="28%"> 
                <input type="text" name="mdk" value="<%=mdk%>" size="14" maxlength="8"  onChange="getDj(insertform)">
                ��mm�� </td>
              <td width="20%"> 
                <div align="right">��/��/����/���Ǹ�</div>
              </td>
              <td width="30%" bgcolor="#FFCCFF"> 
                <input type="text" name="mdg" value="<%=mdg%>" size="14" maxlength="8"  onChange="getDj(insertform)">
                ��mm�� ��<b><font color="#0000FF">�����زĺ�</font></b>�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right">��˫��</td>
              <td width="28%"> <%
		cf.radioToken(out, "dsk","1+����&2+˫��",dsk);
%> </td>
              <td width="20%" align="right">&nbsp;</td>
              <td width="30%">&nbsp; </td>
            </tr>
            <tr> 
              <td width="22%" bgcolor="#FFFFFF" align="right">�Ƿ��ж���</td>
              <td width="28%" bgcolor="#FFFFFF"> <%
		cf.radioToken(out, "sfydc","Y+�ж���&N+�޶���",sfydc);
%></td>
              <td width="20%" bgcolor="#FFFFFF" align="right">����/�ƿڲ���</td>
              <td width="30%" bgcolor="#FFFFFF"> 
                <select name="sfsmjcc" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+��ľ���ɲ�&N+����ľ���ɲ�",sfsmjcc);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">����/���ױ���</div>
              </td>
              <td width="28%"> 
                <select name="ctbs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"3+����&4+�ı�",ctbs);
%> 
                </select>
              </td>
              <td width="20%"> 
                <div align="right">�߽���/ŷʽ��ñ</div>
              </td>
              <td width="30%"> 
                <input type="text" name="tjx" value="<%=tjx%>" size="12" maxlength="8"  onChange="getDj(insertform)">
                ���� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">��������</div>
              </td>
              <td width="28%"> 
                <input type="text" name="sl" value="<%=sl%>" size="20" maxlength="8" >
              </td>
              <td width="20%"> 
                <div align="right"><font color="#0000CC">��׼���ۣ�Ԫ��</font></div>
              </td>
              <td width="30%"> 
                <input type="text" name="dj" value="<%=bzdj%>" size="20" maxlength="9" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="hidden" name="jjfs" value="<%=jjfs%>" >
                <input type="button"  value="����" onClick="f_do(insertform)" name="bc">
                <input type="reset"  value="����" name="reset">
                <input type="button"  value="���¼���۸�" onClick="getDj(insertform)">
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
function tx(mlx)//����FormName:Form������
{
	var tx=getSubStr(mlx);
	if (tx!="")
	{
		alert("ע�⣡"+tx);
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

	if (getjjfs=='11')//11��ľ��
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
	//12��˫���ƿڣ�13��˫�ڴ��ף�14�������ƿڣ�15�����ڴ���
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
	//21��������;22���Ŷ���
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
	//31����Ʈ������
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
	//32����Ʈ��ƽ̨�Ͽ�
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
	//41��ƽ���׼Ƽ�
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
	//42�����׼Ƽ�
	else if (getjjfs=="42")
	{
		if (FormName.tjx.value=='')
		{
			return;
		}
	}
	//43���ֶ�ƽ���׼Ƽ�
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
	//44���ֶ����׼Ƽ�
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
	//45���ֶΰ����ȼƼ�
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

	//Ϊ�˷�ֹ�۸�δ�����꣬��������̡���ť
	FormName.bc.disabled=true;

	var str="Jc_mmydmxCx.jsp?getlx=3&dqbm=<%=dqbm%>&mmdglxbm="+FormName.mmdglxbm.value+"&mlx="+FormName.mlx.value+"&dbh="+FormName.dbh.value;
	str+="&mmxh="+FormName.mmxh.value+"&ysbm="+FormName.ysbm.value+"&ctbs="+FormName.ctbs.value;
	str+="&mdk="+FormName.mdk.value+"&mdg="+FormName.mdg.value+"&qh="+FormName.qh.value+"&tjx="+FormName.tjx.value;
	str+="&sfsmjcc="+FormName.sfsmjcc.value+"&mtxbm="+FormName.mtxbm.value+"&mxxbm="+FormName.mxxbm.value;
//	alert(str);
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("������[Ԥ�������]��");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.mmdglxbm)=="") {
		alert("��ѡ��[ľ�Ŷ�������]��");
		FormName.mmdglxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ysbm)=="") {
		alert("��ѡ��[����]��");
		FormName.ysbm.focus();
		return false;
	}

	if(	javaTrim(FormName.czbm)=="") {
		alert("������[��ɫ]��");
		FormName.czbm.focus();
		return false;
	}

	if(	javaTrim(FormName.jjfs)=="") {
		alert("[�Ƽ۷�ʽ]Ϊ�գ�����ϵϵͳ����Ա��");
		FormName.jjfs.focus();
		return false;
	}

	var getjjfs=FormName.jjfs.value;


	if (getjjfs=='11')//11��ľ��
	{
		if(	javaTrim(FormName.mlx)=="") {
			alert("��ѡ��[������]��");
			FormName.mlx.focus();
			return false;
		}
		if(	javaTrim(FormName.mmxh)=="") {
			alert("��ѡ��[ľ���ͺ�]��");
			FormName.mmxh.focus();
			return false;
		}
		if(	javaTrim(FormName.azwzbm)=="") {
			alert("��ѡ��[��װλ��]��");
			FormName.azwzbm.focus();
			return false;
		}
		if(	javaTrim(FormName.kqfxbm)=="") {
			alert("��ѡ��[��������]��");
			FormName.kqfxbm.focus();
			return false;
		}
		if(	javaTrim(FormName.mtxbm)=="") {
			alert("������[������]��");
			FormName.mtxbm.focus();
			return false;
		}
		if(	javaTrim(FormName.mxxbm)=="") {
			alert("������[��о��]��");
			FormName.mxxbm.focus();
			return false;
		}

		if(	javaTrim(FormName.dczlbm)=="") {
			alert("������[�ز�����]��");
			FormName.dczlbm.focus();
			return false;
		}
		if(	javaTrim(FormName.dbh)=="") {
			alert("������[�ذ��]��");
			FormName.dbh.focus();
			return false;
		}
		if(!(isNumber(FormName.dbh, "�زĺ�"))) {
			return false;
		}

		if(	javaTrim(FormName.qh)=="") {
			alert("������[ǽ��]��");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "ǽ��"))) {
			return false;
		}
		if(	javaTrim(FormName.mdk)=="") {
			alert("������[��/������]��");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "��/������"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("������[��/������]��");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "��/������"))) {
			return false;
		}
	}
	//12��˫���ƿڣ�13��˫�ڴ��ף�14�������ƿڣ�15�����ڴ���;21��������;22���Ŷ���
	else if (getjjfs=="12" || getjjfs=="13" || getjjfs=="14" || getjjfs=="15" || getjjfs=="21" || getjjfs=="22")
	{
		if(	javaTrim(FormName.mtxbm)=="") {
			alert("������[������]��");
			FormName.mtxbm.focus();
			return false;
		}
		if(	javaTrim(FormName.mxxbm)=="") {
			alert("������[��о��]��");
			FormName.mxxbm.focus();
			return false;
		}
		if(	javaTrim(FormName.qh)=="") {
			alert("������[ǽ��]��");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "ǽ��"))) {
			return false;
		}
		if(	javaTrim(FormName.mdk)=="") {
			alert("������[�Ŷ���]��");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "�Ŷ���"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("������[�Ŷ���]��");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "�Ŷ���"))) {
			return false;
		}
		if(	javaTrim(FormName.ctbs)=="") {
			alert("������[����/���ױ���]��");
			FormName.ctbs.focus();
			return false;
		}
	}
	//31����Ʈ������
	else if (getjjfs=="31" )
	{
		if(	javaTrim(FormName.qh)=="") {
			alert("������[����ǽ��]��");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "����ǽ��"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("������[���ڸ�]��");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "���ڸ�"))) {
			return false;
		}
	}
	//32����Ʈ��ƽ̨�Ͽ�
	else if (getjjfs=="32" )
	{
		if(	javaTrim(FormName.qh)=="") {
			alert("������[ƽ̨�Ͽ�ǽ��]��");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "ƽ̨�Ͽ�ǽ��"))) {
			return false;
		}
		if(	javaTrim(FormName.mdk)=="") {
			alert("������[ƽ̨�Ͽڿ�]��");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "ƽ̨�Ͽڿ�"))) {
			return false;
		}
	}
	//41��ƽ���׼Ƽ�
	else if (getjjfs=="41")
	{
		if(	javaTrim(FormName.mdk)=="") {
			alert("������[�Ŷ���]��");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "�Ŷ���"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("������[�Ŷ���]��");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "�Ŷ���"))) {
			return false;
		}
	}
	//42�����׼Ƽ�
	else if (getjjfs=="42")
	{
		if(	javaTrim(FormName.tjx)=="") {
			alert("������[�߽���/ŷʽ��ñ]��");
			FormName.tjx.focus();
			return false;
		}
		if(!(isFloat(FormName.tjx, "�߽���/ŷʽ��ñ"))) {
			return false;
		}
	}
	//43���ֶ�ƽ���׼Ƽ�
	else if (getjjfs=="43")
	{
		if(	javaTrim(FormName.mdk)=="") {
			alert("������[�Ŷ���]��");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "�Ŷ���"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("������[�Ŷ���]��");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "�Ŷ���"))) {
			return false;
		}
		if(	javaTrim(FormName.qh)=="") {
			alert("������[ǽ��]��");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "ǽ��"))) {
			return false;
		}
	}
	//44���ֶ����׼Ƽ�
	else if (getjjfs=="44")
	{
		if(	javaTrim(FormName.tjx)=="") {
			alert("������[�߽���/ŷʽ��ñ]��");
			FormName.tjx.focus();
			return false;
		}
		if(!(isFloat(FormName.tjx, "�߽���/ŷʽ��ñ"))) {
			return false;
		}
		if(	javaTrim(FormName.qh)=="") {
			alert("������[ǽ��]��");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "ǽ��"))) {
			return false;
		}
	}
	//45���ֶΰ����ȼƼ�
	else if (getjjfs=="45")
	{
		if(	javaTrim(FormName.mdk)=="") {
			alert("������[���]��");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "���"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("������[�߶�]��");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "�߶�"))) {
			return false;
		}
	}

	if(	javaTrim(FormName.sl)=="") {
		alert("������[��������]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="" || FormName.dj.value=="0") {
		alert("[����]����Ϊ�գ������Ǽ۸���Ϣ��������δ�鵽�۸���Ϣ��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "����"))) {
		return false;
	}
	FormName.submit();
	return true;

}
//-->
</SCRIPT>

