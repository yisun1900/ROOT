<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String khbh=null;
	String hth=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}


	String cw_jzsjxgjl_xgsj=null;
	String cw_jzsjxgjl_xgr=null;
	String cw_jzsjxgjl_xglx=null;
	String yqdjzsj=null;
	String xghqdjzsj=null;
	String ytdjzsj=null;
	String xghtdjzsj=null;
	cw_jzsjxgjl_xgsj=request.getParameter("cw_jzsjxgjl_xgsj");
	if (cw_jzsjxgjl_xgsj!=null)
	{
		cw_jzsjxgjl_xgsj=cw_jzsjxgjl_xgsj.trim();
		if (!(cw_jzsjxgjl_xgsj.equals("")))	wheresql+="  and (cw_jzsjxgjl.xgsj>=TO_DATE('"+cw_jzsjxgjl_xgsj+"','YYYY/MM/DD'))";
	}
	cw_jzsjxgjl_xgsj=request.getParameter("cw_jzsjxgjl_xgsj2");
	if (cw_jzsjxgjl_xgsj!=null)
	{
		cw_jzsjxgjl_xgsj=cw_jzsjxgjl_xgsj.trim();
		if (!(cw_jzsjxgjl_xgsj.equals("")))	wheresql+="  and (cw_jzsjxgjl.xgsj<=TO_DATE('"+cw_jzsjxgjl_xgsj+" 23:59:59','YYYY/MM/DD hh24:mi:ss'))";
	}
	cw_jzsjxgjl_xgr=request.getParameter("cw_jzsjxgjl_xgr");
	if (cw_jzsjxgjl_xgr!=null)
	{
		cw_jzsjxgjl_xgr=cf.GB2Uni(cw_jzsjxgjl_xgr);
		if (!(cw_jzsjxgjl_xgr.equals("")))	wheresql+=" and  (cw_jzsjxgjl.xgr='"+cw_jzsjxgjl_xgr+"')";
	}

	cw_jzsjxgjl_xglx=request.getParameter("cw_jzsjxgjl_xglx");
	if (cw_jzsjxgjl_xglx!=null)
	{
		cw_jzsjxgjl_xglx=cf.GB2Uni(cw_jzsjxgjl_xglx);
		if (!(cw_jzsjxgjl_xglx.equals("")))	wheresql+=" and  (cw_jzsjxgjl.xglx='"+cw_jzsjxgjl_xglx+"')";
	}
	yqdjzsj=request.getParameter("yqdjzsj");
	if (yqdjzsj!=null)
	{
		yqdjzsj=yqdjzsj.trim();
		if (!(yqdjzsj.equals("")))	wheresql+="  and (cw_jzsjxgjl.yqdjzsj=TO_DATE('"+yqdjzsj+"','YYYY/MM/DD'))";
	}
	xghqdjzsj=request.getParameter("xghqdjzsj");
	if (xghqdjzsj!=null)
	{
		xghqdjzsj=xghqdjzsj.trim();
		if (!(xghqdjzsj.equals("")))	wheresql+="  and (cw_jzsjxgjl.xghqdjzsj=TO_DATE('"+xghqdjzsj+"','YYYY/MM/DD'))";
	}
	ytdjzsj=request.getParameter("ytdjzsj");
	if (ytdjzsj!=null)
	{
		ytdjzsj=ytdjzsj.trim();
		if (!(ytdjzsj.equals("")))	wheresql+="  and (cw_jzsjxgjl.ytdjzsj=TO_DATE('"+ytdjzsj+"','YYYY/MM/DD'))";
	}
	xghtdjzsj=request.getParameter("xghtdjzsj");
	if (xghtdjzsj!=null)
	{
		xghtdjzsj=xghtdjzsj.trim();
		if (!(xghtdjzsj.equals("")))	wheresql+="  and (cw_jzsjxgjl.xghtdjzsj=TO_DATE('"+xghtdjzsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT cw_jzsjxgjl.khbh,cw_jzsjxgjl.hth,cw_jzsjxgjl.khxm,crm_khxx.sjs, DECODE(cw_jzsjxgjl.zt,'2','��װ�ͻ�','3','�˵��ͻ�','4','���ɿͻ�','5','��ƿͻ�'),cw_jzsjxgjl.xgsj,cw_jzsjxgjl.xgr, DECODE(cw_jzsjxgjl.xglx,'1','�޸�','2','ɾ��','3','����'),cw_jzsjxgjl.yqdjzsj,cw_jzsjxgjl.xghqdjzsj,cw_jzsjxgjl.ytdjzsj,cw_jzsjxgjl.xghtdjzsj,cw_jzsjxgjl.xgsm";
	ls_sql+=" FROM crm_khxx,cw_jzsjxgjl  ";
    ls_sql+=" where cw_jzsjxgjl.khbh=crm_khxx.khbh";
    ls_sql+=wheresql;
    ls_sql+=" order  by xgsj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_jzsjxgjlCxList.jsp","SelectCxCw_jzyjxgjl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ����תʱ���޸ļ�¼</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">�ͻ����</td>
	<td  width="7%">��ͬ��</td>
	<td  width="7%">�ͻ�����</td>
	<td  width="6%">���ʦ</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="7%">�޸�ʱ��</td>
	<td  width="5%">�޸���</td>
	<td  width="5%">�޸�����</td>
	<td  width="7%">ԭǩ����תʱ��</td>
	<td  width="7%">�޸ĺ�ǩ����תʱ��</td>
	<td  width="7%">ԭ�˵���תʱ��</td>
	<td  width="7%">�޸ĺ��˵���תʱ��</td>
	<td  width="24%">�޸�˵��</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>