<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�޸�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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
String msk=null;
String msg=null;
String ctbs=null;
String tjx=null;
String dj=null;
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
	ls_sql="select msg,msk,mtxbm,mxxbm,dsk,yddbh,mmdglxbm,mlx,mmxh,sl,ysbm,czbm,azwzbm,kqfxbm,dbh,qh,mdk,mdg,ctbs,tjx,dj,blxhbm,bz,dczlbm,sfsmjcc,sfydc ";
	ls_sql+=" from  jc_mmccd";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		msg=cf.fillNull(rs.getString("msg"));
		msk=cf.fillNull(rs.getString("msk"));
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
      <div align="center">�޸�ľ�ų��ⵥ��<font color="#FF6699">ע�⣺��ɫ���ֻ�Ӱ�쵽�۸�[��/������]Ϊδ��[�زĺ�]ֵ</font>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_mmccd.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">Ԥ�������</div>
              </td>
              <td width="29%"> 
                <input type="hidden" name="wherexh"  value="<%=wherexh%>" >
                <input type="text" name="yddbh" value="<%=yddbh%>" size="20" maxlength="9" readonly>
              </td>
              <td width="18%"> 
                <div align="right">��������</div>
              </td>
              <td width="32%"> 
                <select name="mmdglxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDglx(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmdglxbm,mmdglxmc from jc_mmdglx order by mmdglxbm",mmdglxbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">������</div>
              </td>
              <td width="29%" bgcolor="#FFFFFF"> 
                <select name="mlx" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="tx(mlx);getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mlx,mlxmc||':'||tx from jdm_mlx order by mlx",mlx);
%> 
                </select>
              </td>
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right">��ɫ</div>
              </td>
              <td width="32%" bgcolor="#FFFFFF"> 
                <select name="czbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select czbm,czmc  from dm_czbm order by czbm",czbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" bgcolor="#FFCCFF" align="right">ľ���ͺ�</td>
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
              <td width="21%" bgcolor="#FFCCFF"> 
                <div align="right">����</div>
              </td>
              <td colspan="3" bgcolor="#FFCCFF"> 
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:452PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
		if (mmdglxbm.equals("01"))//�����ţ��Ƽ۲��ֵ�˫��
		{
			cf.selectItem(out,"select distinct jc_mmbjb.ysbm,mmczmc from  jc_mmbjb,jdm_mmczbm where jc_mmbjb.dqbm='"+dqbm+"' and jc_mmbjb.mmxh='"+mmxh+"' and jc_mmbjb.ysbm=jdm_mmczbm.mmczbm order by mmczmc",ysbm);
		}
		//11:˫���ƿ�,12:�����ƿ�,13:˫�ڴ��ף�14�����ڴ��ף�15��˫����Ʈ�������ڣ�16��������Ʈ��������
		else if (mmdglxbm.equals("11") || mmdglxbm.equals("12") || mmdglxbm.equals("13")||mmdglxbm.equals("14") || mmdglxbm.equals("15") || mmdglxbm.equals("16"))
		{
			cf.selectItem(out,"select distinct jc_mtbjb.ysbm,mmczmc from  jc_mtbjb,jdm_mmczbm where jc_mtbjb.dqbm='"+dqbm+"' and jc_mtbjb.mmdglxbm='"+mmdglxbm+"' and jc_mtbjb.ysbm=jdm_mmczbm.mmczbm order by mmczmc",ysbm);
		}
		//���������۱�
		//21:�ɿ���������
		else if (mmdglxbm.equals("21")||mmdglxbm.equals("22")||mmdglxbm.equals("23")||mmdglxbm.equals("24")||mmdglxbm.equals("25")||mmdglxbm.equals("26"))
		{
			cf.selectItem(out,"select distinct jc_mlcbjb.ysbm,mmczmc from  jc_mlcbjb,jdm_mmczbm where jc_mlcbjb.dqbm='"+dqbm+"' and jc_mlcbjb.mmdglxbm='"+mmdglxbm+"' and jc_mlcbjb.ysbm=jdm_mmczbm.mmczbm  order by mmczmc",ysbm);
		}
		//�Ŷ������۱�
		else if (mmdglxbm.equals("31")||mmdglxbm.equals("32")||mmdglxbm.equals("33")||mmdglxbm.equals("34")||mmdglxbm.equals("35")||mmdglxbm.equals("36"))
		{
			cf.selectItem(out,"select distinct jc_mlcbjb.ysbm,mmczmc from  jc_mlcbjb,jdm_mmczbm where jc_mlcbjb.dqbm='"+dqbm+"' and jc_mlcbjb.mmdglxbm='"+mmdglxbm+"' and jc_mlcbjb.ysbm=jdm_mmczbm.mmczbm  order by mmczmc",ysbm);
		}
		else if (mmdglxbm.equals("41") || mmdglxbm.equals("42") || mmdglxbm.equals("43") || mmdglxbm.equals("44") || mmdglxbm.equals("45") || mmdglxbm.equals("46") || mmdglxbm.equals("47") || mmdglxbm.equals("48"))//41:�߽��ߣ�42:��Ʈ����ƽ̨�Ͽ�,43-48:ŷʽ��ñ
		{
			cf.selectItem(out,"select distinct jc_tjxbjb.ysbm,mmczmc from  jc_tjxbjb,jdm_mmczbm where jc_tjxbjb.dqbm='"+dqbm+"' and jc_tjxbjb.mmdglxbm='"+mmdglxbm+"' and jc_tjxbjb.ysbm=jdm_mmczbm.mmczbm order by mmczmc",ysbm);
		}
		else if (mmdglxbm.equals("51"))//41:���ǣ��۽ǡ�������
		{
			cf.selectItem(out,"select distinct jc_hjbjb.ysbm,mmczmc from jc_hjbjb,jdm_mmczbm where jc_hjbjb.dqbm='"+dqbm+"' and jc_hjbjb.mmdglxbm='"+mmdglxbm+"' and jc_hjbjb.ysbm=jdm_mmczbm.mmczbm  order by mmczmc",ysbm);
		}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">��װλ��</div>
              </td>
              <td width="29%"> 
                <select name="azwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select azwzbm,azwzmc from jdm_azwzbm order by azwzbm",azwzbm);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">��������</div>
              </td>
              <td width="32%"> 
                <select name="kqfxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select kqfxbm,kqfxmc from jdm_kqfxbm order by kqfxbm",kqfxbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">����,�ƿ�,���ף�������</td>
              <td width="29%"> 
                <select name="mtxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mtxbm,mtxmc from jdm_mtxbm order by mtxbm",mtxbm);
%> 
                </select>
              </td>
              <td width="18%" align="right">����,�ƿ�,���ף���о��</td>
              <td width="32%"> 
                <select name="mxxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mxxbm,mxxmc from jdm_mxxbm order by mxxbm",mxxbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">�ز�����</td>
              <td width="29%"> 
                <select name="dczlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJg(dczlbm,dbh);getDj(insertform);">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dczlbm,dczlmc||'�����:'||dzhd from jdm_dczlbm order by dczlbm",dczlbm);
%> 
                </select>
              </td>
              <td width="18%" align="right">�����ͺ�</td>
              <td width="32%"> 
                <select name="blxhbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select blxhbm,blxh from jc_blbj order by blxhbm",blxhbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFCCFF">��/��/ƽ̨�Ͽ�/����ǽ��</td>
              <td width="29%" bgcolor="#FFCCFF"> 
                <input type="text" name="qh" value="<%=qh%>" size="14" maxlength="8"  onChange="getDj(insertform)">
                ��mm�� </td>
              <td width="18%" align="right" bgcolor="#FFFFFF">�زĺ�</td>
              <td width="32%"> 
                <input type="text" name="dbh" value="<%=dbh%>" size="14" maxlength="8"  onChange="getDj(insertform)" >
                ��mm�� </td>
            </tr>
            <tr bgcolor="#FFCCFF"> 
              <td width="21%"> 
                <div align="right">��/��/ƽ̨�Ͽ�/���ǿ�</div>
              </td>
              <td width="29%"> 
                <input type="text" name="mdk" value="<%=mdk%>" size="14" maxlength="8"  onChange="getDj(insertform)">
                ��mm�� </td>
              <td width="18%"> 
                <div align="right">��/��/����/���Ǹ�</div>
              </td>
              <td width="32%" bgcolor="#FFCCFF"> 
                <input type="text" name="mdg" value="<%=mdg%>" size="14" maxlength="8"  onChange="getDj(insertform)">
                ��mm�� ��<b><font color="#0000FF">�����زĺ�</font></b>�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">���ȿ�</td>
              <td width="29%"> 
                <input type="text" name="msk" value="<%=msk%>" size="14" maxlength="8">
                ��mm�� </td>
              <td width="18%" align="right">���ȸ�</td>
              <td width="32%"> 
                <input type="text" name="msg" value="<%=msg%>" size="14" maxlength="8">
                ��mm����<b><font color="#0000FF">�����زĺ�</font></b>��</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">��˫��</td>
              <td width="29%"> <%
		cf.radioToken(out, "dsk","1+����&2+˫��",dsk);
%> </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr> 
              <td width="21%" bgcolor="#FFFFFF" align="right">�Ƿ��ж���</td>
              <td width="29%" bgcolor="#FFFFFF"> <%
		cf.radioToken(out, "sfydc","Y+�ж���&N+�޶���",sfydc);
%></td>
              <td width="18%" bgcolor="#FFFFFF" align="right">����/�ƿڲ���</td>
              <td width="32%" bgcolor="#FFFFFF"> 
                <select name="sfsmjcc" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+��ľ���ɲ�&N+����ľ���ɲ�",sfsmjcc);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">����/���ױ���</div>
              </td>
              <td width="29%"> 
                <select name="ctbs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"3+����&4+�ı�",ctbs);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">�߽���/ŷʽ��ñ</div>
              </td>
              <td width="32%"> 
                <input type="text" name="tjx" value="<%=tjx%>" size="12" maxlength="8"  onChange="getDj(insertform)">
                ���� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">��������</div>
              </td>
              <td width="29%"> 
                <input type="text" name="sl" value="<%=sl%>" size="20" maxlength="8" >
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">���ۣ�Ԫ��</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="dj" value="<%=dj%>" size="20" maxlength="9" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="hidden" name="jjfs" value="<%=jjfs%>" >
                <input type="button"  value="����" onClick="f_do(insertform)" name="bc">
                <input type="reset"  value="����" name="reset">
                <input type="button"  value="���¼���۸�" onClick="getDj(insertform)" name="button">
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


	var str="/jcjj/mmcl/qdht/Jc_mmydmxCx.jsp?getlx=1&dqbm=<%=dqbm%>&mmdglxbm="+FormName.mmdglxbm.value;
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

	var str="/jcjj/mmcl/qdht/Jc_mmydmxCx.jsp?getlx=2&dqbm=<%=dqbm%>&mmdglxbm="+FormName.mmdglxbm.value+"&mmxh="+FormName.mmxh.value;
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

	var str="/jcjj/mmcl/qdht/Jc_mmydmxCx.jsp?getlx=3&dqbm=<%=dqbm%>&mmdglxbm="+FormName.mmdglxbm.value+"&mlx="+FormName.mlx.value+"&dbh="+FormName.dbh.value;
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

		if(	javaTrim(FormName.dczlbm)=="") {
			alert("������[�ز�����]��");
			FormName.dczlbm.focus();
			return false;
		}
		if(	javaTrim(FormName.dbh)=="") {
			alert("������[�زĺ�]��");
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
		if(!(isNumber(FormName.msk, "���ȿ�"))) {
		return false;
		}
		if(!(isNumber(FormName.msg, "���ȸ�"))) {
			return false;
		}
	}
	//12��˫���ƿڣ�13��˫�ڴ��ף�14�������ƿڣ�15�����ڴ���;21��������;22���Ŷ���
	else if (getjjfs=="12" || getjjfs=="13" || getjjfs=="14" || getjjfs=="15" || getjjfs=="21" || getjjfs=="22")
	{
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

/*	
	if(	javaTrim(FormName.dj)=="") {
		alert("[����]����Ϊ�գ������Ǽ۸���Ϣ��������δ�鵽�۸���Ϣ��");
		FormName.dj.focus();
		return false;
	}
*/
	if(!(isFloat(FormName.dj, "����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

