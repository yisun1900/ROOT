<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/css/buttons.css" type="text/css">
</head>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");

String zwbm=(String)session.getAttribute("zwbm");
String yhmc=(String)session.getAttribute("yhmc");

String sjs=yhmc;
if (!zwbm.equals("04"))
{
	sjs="";
}
String ysy=yhmc;
if (!zwbm.equals("20"))
{
	ysy="";
}
%>

<body bgcolor="#FFFFFF">
<div class="container" style="padding-top:15px;">
<div class="row">
<div class="col-xs-12">
<div class="panel panel-primary">
  <div class="panel-heading">�¿ͻ����� -> ������д��ѯ�������Ա��ѯ����ؿͻ�</div>
  <div class="panel-body">
  <form class="form-horizontal" method="post" action="Crm_zxkhxxCxList.jsp" name="selectform">
    <div class="row">
      <div class="col-xs-6">
        <div class="form-group form-group-xs">
        <label class="col-xs-4 control-label">������˾</label>
        <div class="col-xs-8">
          <select class="form-control" name="ssfgs" onChange="changeFgs(selectform)">
            <%
              if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
              {
                out.println("<option value=\"\"></option>");
                cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
              }
              else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
              {
                out.println("<option value=\"\"></option>");
                cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
          </select>
        </div>
       </div>
       <div class="form-group form-group-xs">
        <label class="col-xs-4 control-label">���ʦ</label>
        <div class="col-xs-8">
          <input class="form-control" type="text" name="sjs" value="<%=sjs%>" maxlength="20" <% if (!sjs.equals("")) out.println("readonly");%>>
        </div>
       </div>
       <div class="form-group form-group-xs">
        <label class="col-xs-4 control-label">�ͻ�����</label>
        <div class="col-xs-8">
          <input class="form-control" type="text" name="crm_zxkhxx_khxm" maxlength="50"/>
        </div>
       </div>
       <div class="form-group form-group-xs">
        <label class="col-xs-4 control-label">��ϵ��ʽ</label>
        <div class="col-xs-8">
          <input class="form-control" type="text" name="crm_zxkhxx_lxfs" maxlength="50"/>
        </div>
       </div>
       <div class="form-group form-group-xs">
        <label class="col-xs-4 control-label">���ݵ�ַ</label>
        <div class="col-xs-8">
          <input class="form-control" type="text" name="crm_zxkhxx_fwdz" maxlength="100"/>
        </div>
       </div> 
              <div class="form-group form-group-xs">
        <label class="col-xs-4 control-label">�ͻ����</label>
        <div class="col-xs-8">
          <input class="form-control" type="text" name="crm_zxkhxx_khbh" maxlength="7"/>
        </div>
       </div> 
              <div class="form-group form-group-xs">
        <label class="col-xs-4 control-label">�ͻ�����ʱ���</label>
        <div class="col-xs-8">
          <input class="form-control" type="text" name="crm_zxkhxx_lrsj" maxlength="10" onDblClick="JSCalendar(this)"/>
        </div>
       </div> 
      </div>
      <div class="col-xs-6">
        <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label">��ѯ����</label>
          <div class="col-xs-8">
            <select name="zxdm" class="form-control">
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
            </select>
          </div>
        </div>
       <div class="form-group form-group-xs">
        <label class="col-xs-4 control-label">Ԥ��Ա</label>
        <div class="col-xs-8">
          <input class="form-control" name="ysy" type="text" value="<%=ysy%>" maxlength="20" <% if (!ysy.equals("")) out.println("readonly");%>>
        </div>
       </div>
       <div class="form-group form-group-xs">
        <label class="col-xs-4 control-label">�ͻ�����</label>
        <div class="col-xs-8">
          <input class="form-control" type="text" name="crm_zxkhxx_khxm2" maxlength="50" placeholder="ģ����ѯ">
        </div>
       </div>
       <div class="form-group form-group-xs">
        <label class="col-xs-4 control-label">��ϵ��ʽ</label>
        <div class="col-xs-8">
          <input class="form-control" type="text" name="crm_zxkhxx_lxfs2" maxlength="50" placeholder="ģ����ѯ"/>
        </div>
       </div>
       <div class="form-group form-group-xs">
        <label class="col-xs-4 control-label">���ݵ�ַ</label>
        <div class="col-xs-8">
          <input class="form-control" type="text" name="crm_zxkhxx_fwdz2" maxlength="100" />
        </div>
       </div>
              <div class="form-group form-group-xs">
        <label class="col-xs-4 control-label">��Ϣ¼����</label>
        <div class="col-xs-8">
          <input class="form-control" type="text" name="crm_zxkhxx_lrr" maxlength="20" />
        </div>
       </div> 
              <div class="form-group form-group-xs">
        <label class="col-xs-4 control-label">��</label>
        <div class="col-xs-8">
          <input class="form-control" type="text" name="crm_zxkhxx_lrsj2" maxlength="10" onDblClick="JSCalendar(this)">
        </div>
       </div> 
      </div>
    </div>
  </form>
  </div>
  <div class="panel-footer text-center">
    <button class="button button-glow button-rounded button-raised button-action button-small" type="button" onClick="f_do(selectform)">
      <i class="fa fa-save"></i> ��ѯ
    </button>
    <button class="button button-glow button-rounded button-raised button-primary button-small" type="button" onClick="javascript:document.forms[0].reset()">
      <i class="fa fa-reset"></i> ����
    </button>
  </div>                
</div>
</div>
</div>
</div>
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

function changeFgs(FormName)
{
	FormName.zxdm.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

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


function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.zxdm,ajaxRetStr);
}

function f_do(FormName)//����FormName:Form������
{
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
