<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE3 {color: #0000CC; font-weight: bold; }
-->
</style>
</head>


<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
String ywyssxz=cf.fillNull(cf.executeQuery("select sjsbh from sq_yhxx where ygbh='"+ygbh+"'"));

String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");

String sjs=yhmc;
if (!zwbm.equals("04"))
{
	sjs="";
}
String ywy=yhmc;
if (!zwbm.equals("19"))
{
	ywy="";
}
String khjl=yhmc;
if (!zwbm.equals("03"))
{
	khjl="";
}

%>

<body bgcolor="#FFFFFF">

<form method="post" action="Crm_zxkhxxList.jsp" name="selectform">
<div align="center">��ѯ�ͻ�--ά��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr bgcolor="#FFFFCC"> 
	  <td width="19%" align="right" bgcolor="#FFFFCC"> 
		�ͻ������ֹ�˾              </td>
	  <td width="31%">
		<select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
		<%
			if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
			}
			else{
				out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
				return;
			}
		%> 
		</select>			  </td>
	  <td width="18%" align="right"> 
		��ѯ����              </td>
	  <td width="32%"> 
		<select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="sjsbhMark=0;sjsbh.length=1;">
		  <%
			if (kfgssq.equals("2") || kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
			}
			else if (kfgssq.equals("1") )
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
			}
			else if (kfgssq.equals("3"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
			}
			else if (kfgssq.equals("4"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ","");
			}
			else{
				out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
				return;
			}
			%> 
		</select>              </td>
	</tr>
	<tr bgcolor="#FFFFCC"> 
	  <td width="19%" align="right">���������</td>
	  <td width="31%"> 
<%
if ( zwbm.equals("04"))
{
	%>
	<select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
	  <option value=""></option>
	</select>
	<%
}
else if (zwbm.equals("23") )
{
	%>
	  <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
		<%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ywyssxz+"' order by dwbh",ywyssxz);
		%>
	  </select>
	<%
}
else{
	%>
	<select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('sjsbh')">
	  <option value=""></option>
	</select>
	<%
}
%>		</td>
	  <td width="18%" align="right">���ʦ</td>
	  <td width="32%"><input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" <% if (!sjs.equals("")) out.println("readonly");%>></td>
	</tr>
	<tr bgcolor="#FFFFCC">
	  <td align="right">ҵ��Ա����С��</td>
	  <td>
<%
if ( zwbm.equals("19"))
{
	%>
	  <select name="ywyssxz" style="FONT-SIZE:12PX;WIDTH:152PX" >
		<option value=""></option>
	  </select>
	<%
}
else if (zwbm.equals("24") )
{
	%>
	  <select name="ywyssxz" style="FONT-SIZE:12PX;WIDTH:152PX">
		<%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ywyssxz+"' order by dwbh",ywyssxz);
		%>
	  </select>
	<%
}
else{
	%>
	  <select name="ywyssxz" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThis('ywyssxz')">
		<option value=""></option>
	  </select>
	<%
}
%>	  </td>
	  <td align="right">ҵ��Ա</td>
	  <td><input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="20" <% if (!ywy.equals("")) out.println("readonly");%>></td>
    </tr>
	<tr bgcolor="#FFFFCC">
	  <td align="right">��Ϣ��˱�־</td>
	  <td><input type="radio" name="shbz" value="Y">
�����
  <input type="radio" name="shbz" value="N">
δ��� </td>
	  <td align="right">Ԥ����˱�־</td>
	  <td><input type="radio" name="ysshbz" value="N">
δ���
  <input type="radio" name="ysshbz" value="Y">
���ͨ��
<input type="radio" name="ysshbz" value="M">
δͨ��</td>
    </tr>
	<tr bgcolor="#FFFFCC"> 
	  <td width="19%" align="right">�Ƿ������ӱ���</td>
	  <td width="31%"> 
		<input type="radio" name="sfzdzbj" value="N">
		δ������ 
		<input type="radio" name="sfzdzbj" value="Y">
		���� </td>
	  <td width="18%" align="right">��װ��־</td>
	  <td width="32%"> 
		<input type="radio" name="jzbz" value="1">
		��װ 
		<input type="radio" name="jzbz" value="2">
		��װ </td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right">��Ч��Ϣ��־</td>
	  <td><input type="radio" name="yzxxbz" value="Y">
		��Ч��Ϣ
		  <input type="radio" name="yzxxbz" value="N">
	  ��Ч��Ϣ</td>
	  <td align="right">�����������־</td>
	  <td><select name="lfdjbz" style="FONT-SIZE:12PX;WIDTH:152PX">
		<option value=""></option>
		<option value="0">δ����������</option>
		<option value="1">�ѽ���������</option>
		<option value="2">���˶���</option>
	  </select></td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right"> 
		�ͻ����              </td>
	  <td width="31%"> 
		<input type="text" name="crm_zxkhxx_khbh" size="20" maxlength="7" >              </td>
	  <td width="18%" align="right">&nbsp;</td>
	  <td width="32%">&nbsp;</td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right"><span class="STYLE3">�ͻ�����</span></td>
	  <td width="31%"> 
		<input type="text" name="khxm" size="20" maxlength="20" >              </td>
	  <td width="18%" align="right">�ͻ�����</td>
	  <td width="32%"> 
		<input type="text" name="khxm2" size="14" maxlength="20" >
		��ģ����ѯ��</td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><span class="STYLE3">���ݵ�ַ </span></td>
	  <td><input type="text" name="fwdz" size="20" maxlength="100" ></td>
	  <td align="right">���ݵ�ַ</td>
	  <td><input type="text" name="fwdz2" size="14" maxlength="100" >
	  ��ģ����ѯ��</td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><span class="STYLE3">��ϵ��ʽ </span></td>
	  <td><input type="text" name="lxfs" size="20" maxlength="50" ></td>
	  <td align="right">��ϵ��ʽ</td>
	  <td> <input type="text" name="lxfs2" size="14" maxlength="50" >
	  ��ģ����ѯ��</td>
	</tr>
	<tr bgcolor="#FFFFFF">
      <td align="right"><strong>С������</strong></td>
	  <td><select name="xqlx" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xqlx c1,xqlx c2 from dm_xqlx order by xqlx","");
%>
      </select></td>
	  <td align="right"><strong>�ͻ���Դ����</strong></td>
	  <td><select name="khzyxz" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
	cf.selectItem(out,"select khzyxz c1,khzyxz c2 from dm_khzyxzbm order by khzyxzbm","");
%>
      </select></td>
    </tr>
	
	<tr bgcolor="#FFFFFF">
      <td align="right">�ͻ�����</td>
	  <td><input type="text" name="khjl" value="<%=khjl%>" size="20" maxlength="20" <% if (!khjl.equals("")) out.println("readonly");%>></td>
	  <td align="right">��Ϣ��Դ˵��</td>
	  <td><input type="text" name="xxlysm" value="" size="20" maxlength="100" ></td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right">�μӴ����</td>
	  <td colspan="3"><select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:516PX" onclick="getThis('cxhdbm')">
		<option value=""></option>
	  </select></td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right">��ѯ״̬</td>
	  <td width="31%"> 
		<select name="crm_zxkhxx_zxzt" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
		  <option value="0">δ�������</option>
		  <option value="1">�������</option>
		  <option value="2">���ʦ�ύ�ɵ�</option>
		  <option value="5">�ɵ����δͨ��</option>
		</select>              </td>
	  <td width="18%" align="right">С��</td>
	  <td width="32%"><input type="text" name="xqbm" value="" size="20" maxlength="50" ></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right"> ¼��ʱ�� �� </td>
	  <td><input type="text" name="crm_zxkhxx_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	  <td align="right"> �� </td>
	  <td><input type="text" name="crm_zxkhxx_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right">��Ϣ¼����</td>
	  <td width="31%"><input type="text" name="crm_zxkhxx_lrr" size="20" maxlength="20" value="" ></td>
	  <td width="18%" align="right">��ϵ�ͻ�</td>
	  <td width="32%"><select name="crm_zxkhxx_khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onclick="getThisOne('khlxbm');">
		<option value=""></option>
	  </select></td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right"> 
		�Ƿ���ط�              </td>
	  <td width="31%">
		<INPUT type="radio" name="crm_zxkhxx_sfxhf" value="Y">��ط�
		<INPUT type="radio" name="crm_zxkhxx_sfxhf" value="N">����ط�			  </td>
	  <td width="18%" align="right"> 
		���»ط�ʱ��              </td>
	  <td width="32%"> 
		<input type="text" name="crm_zxkhxx_zxhfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right">�ط����� ��</td>
	  <td width="31%"> 
		<input type="text" name="crm_zxkhxx_hfrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	  <td width="18%" align="right">��</td>
	  <td width="32%"> 
		<input type="text" name="crm_zxkhxx_hfrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
	</tr>
	<tr bgcolor="#FFFFFF"> 
	  <td width="19%" align="right"> 
		�ص���־              </td>
	  <td width="31%"> 
		<select name="crm_zxkhxx_hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
<%
	cf.selectItem(out,"select hdlxbm,hdlxmc from dm_hdlxbm order by hdlxbm","");
%>
		</select>              </td>
	  <td width="18%" align="right"> 
		�ص���              </td>
	  <td width="32%"> 
		<input name="hdr" type="text" value="" maxlength="20" size="20">              </td>
	</tr>
	
	<tr bgcolor="#FFFFCC"> 
	  <td width="19%" align="right">��ѯ�������</td>
	  <td colspan="3"> ��һ�� 
		<select name="jgpx1" style="FONT-SIZE:12PX;WIDTH:100PX">
		  <option value="crm_zxkhxx.khbh desc">�ͻ����</option>
		  <option value="crm_zxkhxx.lrsj desc">¼��ʱ��</option>
		  <option value="crm_zxkhxx.khxm">�ͻ�����</option>
		  <option value="crm_zxkhxx.fwdz">���ݵ�ַ</option>
		  <option value="crm_zxkhxx.lxfs">��ϵ��ʽ</option>
		  <option value="crm_zxkhxx.nlqjbm">��������</option>
		  <option value="crm_zxkhxx.ysrbm">������</option>
		  <option value="crm_zxkhxx.zybm">ְҵ</option>
		  <option value="crm_zxkhxx.sjs">���ʦ</option>
		  <option value="crm_zxkhxx.jhjfsj">�ƻ�����ʱ��</option>
		  <option value="crm_zxkhxx.yjzxsj">Ԥ��װ��ʱ��</option>
		  <option value="crm_zxkhxx.zxzt">��ѯ״̬</option>
		  <option value="crm_zxkhxx.zxdm">��ѯ����</option>
		  <option value="crm_zxkhxx.sbyybm">ʧ��ԭ��</option>
		  <option value="crm_zxkhxx.ywy">ҵ��Ա</option>
		  <option value="crm_zxkhxx.cqbm">��������</option>
		  <option value="crm_zxkhxx.xqbm">С��</option>
		  <option value="crm_zxkhxx.rddqbm">�ȵ����</option>
		  <option value="crm_zxkhxx.hxwzbm">����λ��</option>
		  <option value="crm_zxkhxx.cxhdbm">�μӴ����</option>
		</select>
		�ڶ��� 
		<select name="jgpx2" style="FONT-SIZE:12PX;WIDTH:100PX">
		  <option value=""></option>
		  <option value="crm_zxkhxx.khbh desc">�ͻ����</option>
		  <option value="crm_zxkhxx.lrsj desc">¼��ʱ��</option>
		  <option value="crm_zxkhxx.khxm">�ͻ�����</option>
		  <option value="crm_zxkhxx.fwdz">���ݵ�ַ</option>
		  <option value="crm_zxkhxx.lxfs">��ϵ��ʽ</option>
		  <option value="crm_zxkhxx.nlqjbm">��������</option>
		  <option value="crm_zxkhxx.ysrbm">������</option>
		  <option value="crm_zxkhxx.zybm">ְҵ</option>
		  <option value="crm_zxkhxx.sjs">���ʦ</option>
		  <option value="crm_zxkhxx.jhjfsj">�ƻ�����ʱ��</option>
		  <option value="crm_zxkhxx.yjzxsj">Ԥ��װ��ʱ��</option>
		  <option value="crm_zxkhxx.zxzt">��ѯ״̬</option>
		  <option value="crm_zxkhxx.zxdm">��ѯ����</option>
		  <option value="crm_zxkhxx.sbyybm">ʧ��ԭ��</option>
		  <option value="crm_zxkhxx.ywy">ҵ��Ա</option>
		  <option value="crm_zxkhxx.cqbm">��������</option>
		  <option value="crm_zxkhxx.xqbm">С��</option>
		  <option value="crm_zxkhxx.rddqbm">�ȵ����</option>
		  <option value="crm_zxkhxx.hxwzbm">����λ��</option>
		  <option value="crm_zxkhxx.cxhdbm">�μӴ����</option>
		</select>
		������ 
		<select name="jgpx3" style="FONT-SIZE:12PX;WIDTH:100PX">
		  <option value=""></option>
		  <option value="crm_zxkhxx.khbh desc">�ͻ����</option>
		  <option value="crm_zxkhxx.lrsj desc">¼��ʱ��</option>
		  <option value="crm_zxkhxx.khxm">�ͻ�����</option>
		  <option value="crm_zxkhxx.fwdz">���ݵ�ַ</option>
		  <option value="crm_zxkhxx.lxfs">��ϵ��ʽ</option>
		  <option value="crm_zxkhxx.nlqjbm">��������</option>
		  <option value="crm_zxkhxx.ysrbm">������</option>
		  <option value="crm_zxkhxx.zybm">ְҵ</option>
		  <option value="crm_zxkhxx.sjs">���ʦ</option>
		  <option value="crm_zxkhxx.jhjfsj">�ƻ�����ʱ��</option>
		  <option value="crm_zxkhxx.yjzxsj">Ԥ��װ��ʱ��</option>
		  <option value="crm_zxkhxx.zxzt">��ѯ״̬</option>
		  <option value="crm_zxkhxx.zxdm">��ѯ����</option>
		  <option value="crm_zxkhxx.sbyybm">ʧ��ԭ��</option>
		  <option value="crm_zxkhxx.ywy">ҵ��Ա</option>
		  <option value="crm_zxkhxx.cqbm">��������</option>
		  <option value="crm_zxkhxx.xqbm">С��</option>
		  <option value="crm_zxkhxx.rddqbm">�ȵ����</option>
		  <option value="crm_zxkhxx.hxwzbm">����λ��</option>
		  <option value="crm_zxkhxx.cxhdbm">�μӴ����</option>
		</select>              </td>
	</tr>
	<tr> 
	  <td colspan="4" align="center"> 
		<input type="button"  value="��ѯ" onClick="f_do(selectform)">
		<input type="reset"  value="����">              </td>
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

var sjsbhMark=0;
var ywyssxzMark=0;
var cxhdbmMark=0;
var khlxbmMark=0;

var fieldName="";

function changeFgs(FormName)
{
	FormName.zxdm.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	fieldName="dwbh";

	sjsbhMark=0;
	ywyssxzMark=0;
	cxhdbmMark=0;
	FormName.sjsbh.length=1;
	FormName.cxhdbm.length=1;

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1����Ȩ�����ֹ�˾;2����Ȩ����ֹ�˾
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getThis(lx)
{
	var sql;

	fieldName=lx;

	if (selectform.ssfgs.value=="")
	{
		selectform.ssfgs.focus();
		alert("������ѡ�񡾷ֹ�˾��");
		return;
	}

	if (lx=="sjsbh")
	{
		if (sjsbhMark==0)
		{
			if (selectform.zxdm.value=="")
			{
				sjsbhMark=0;
				selectform.zxdm.focus();
				alert("������ѡ����ѯ���桿");
				return;
			}

			var sql="select dwbh,dwmc from sq_dwxx where dwlx='F3' and  cxbz='N' and ssdw='"+selectform.zxdm.value+"' order by dwbh";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			sjsbhMark=1;
		}
		else{
			sjsbhMark=2;
		}
	}
	else if (lx=="ywyssxz")
	{
		if (ywyssxzMark==0)
		{
			var sql="select dwbh,dwmc from sq_dwxx where dwlx='F4' and  cxbz='N' and ssfgs='"+selectform.ssfgs.value+"' order by dwbh";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			ywyssxzMark=1;
		}
		else{
			ywyssxzMark=2;
		}
	}
	else if (lx=="cxhdbm")
	{
		if (cxhdbmMark==0)
		{
			sql="select cxhdmc c1,cxhdmc||DECODE(jsbz,'N','','Y','��������') c2 from jc_cxhd where fgsbh='"+selectform.ssfgs.value+"' order by jsbz,cxhdbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;

			openAjax(actionStr);
			cxhdbmMark=1;
		}
		else{
			cxhdbmMark=2;
		}
	}
}

function getThisOne(lx)
{
	var sql;

	fieldName=lx;

	if (lx=="khlxbm")
	{
		if (khlxbmMark==0)
		{
			var sql="select khlxbm,khlxmc from dm_khlxbm order by khlxbm";
			var actionStr="/ajax/selectstr.jsp?sql="+sql;
			
			openAjax(actionStr);

			khlxbmMark=1;
		}
	}
}

function getAjax(ajaxRetStr) 
{
	if (fieldName=="dwbh")
	{
		strToSelect(selectform.zxdm,ajaxRetStr);
	}
	else if (fieldName=="sjsbh")
	{
		strToSelect(selectform.sjsbh,ajaxRetStr);
	}
	else if (fieldName=="ywyssxz")
	{
		strToSelect(selectform.ywyssxz,ajaxRetStr);
	}
	else if (fieldName=="cxhdbm")
	{
		strToSelect(selectform.cxhdbm,ajaxRetStr);
	}
	else if (fieldName=="khlxbm")
	{
		strToSelect(selectform.crm_zxkhxx_khlxbm,ajaxRetStr);
	}
}

function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.crm_zxkhxx_zxhfsj, "���»ط�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_hfrq, "�ط�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_hfrq2, "�ط�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
