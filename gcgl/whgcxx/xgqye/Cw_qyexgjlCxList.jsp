<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
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
	String qyrq=null;
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}



	String xgjlh=null;
	String lrr=null;
	String lrsj=null;
	xgjlh=request.getParameter("xgjlh");
	if (xgjlh!=null)
	{
		xgjlh=cf.GB2Uni(xgjlh);
		if (!(xgjlh.equals("")))	wheresql+=" and  (cw_qyexgjl.xgjlh='"+xgjlh+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (cw_qyexgjl.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (cw_qyexgjl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (cw_qyexgjl.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT xgjlh,cw_qyexgjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,xgqzkl,xgqzjxzkl,xgqcdzwjmje,xgqglfjmje,xgqsjjmje,xgqwdzgce,xgqqye,xgqpmjj,xgqzxjwbm,xgqsuijinbfb,xgqsuijin,xgqglfbfb,xgqzqguanlif,xgqguanlif,xgqzqwjrqyexm,xgqzhwjrqyexm,xgqwjrqyexmsm,xgqsjf,xgqglf,xghzkl,xghzjxzkl,xghcdzwjmje,xghglfjmje,xghsjjmje,xghwdzgce,xghqye,xghpmjj,xghzxjwbm,xghsuijinbfb,xghsuijin,xghglfbfb,xghzqguanlif,xghguanlif,xghzqwjrqyexm,xghzhwjrqyexm,xghwjrqyexmsm,xghsjf,xghglf,cw_qyexgjl.lrr,cw_qyexgjl.lrsj,dwmc,cw_qyexgjl.bz  ";
	ls_sql+=" FROM cw_qyexgjl,crm_khxx,sq_dwxx  ";
    ls_sql+=" where cw_qyexgjl.khbh=crm_khxx.khbh and cw_qyexgjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_qyexgjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_qyexgjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xgjlh","khbh","xgqzkl","xgqcdzwjmje","xgqwdzgce","xgqqye","xgqpmjj","xgqzxjwbm","xgqsuijinbfb","xgqsuijin","xgqglfbfb","xgqzqguanlif","xgqguanlif","xgqzqwjrqyexm","xgqzhwjrqyexm","xgqwjrqyexmsm","xgqsjf","xgqglf","xghzkl","xghcdzwjmje","xghwdzgce","xghqye","xghpmjj","xghzxjwbm","xghsuijinbfb","xghsuijin","xghglfbfb","xghzqguanlif","xghguanlif","xghzqwjrqyexm","xghzhwjrqyexm","xghwjrqyexmsm","xghsjf","xghglf","lrr","lrsj","lrbm","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xgjlh"};
	pageObj.setKey(keyName);


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
  <B><font size="3">��ѯ���޸�ǩԼ���¼</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(500);
%>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="2%" rowspan="2">�޸ļ�¼��</td>
  <td  width="2%" rowspan="2">�ͻ����</td>
  <td  width="2%" rowspan="2">�ͻ�����</td>
  <td  width="5%" rowspan="2">���ݵ�ַ</td>
  <td  width="2%" rowspan="2">��ͬ��</td>
  <td colspan="19"><strong><font color="#0000CC">�޸�ǰ</font></strong></td>
  <td colspan="19"><font color="#FF0000"><strong>�޸ĺ�</strong></font></td>
  <td width="2%" rowspan="2">¼����</td>
  <td width="2%" rowspan="2">¼��ʱ��</td>
  <td width="3%" rowspan="2">¼�벿��</td>
  <td width="8%" rowspan="2">��ע</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%"><font color="#0000CC">��ͬ�ۿ�</font></td>
	<td  width="1%"><font color="#0000CC">�������ۿ�</font></td>
	<td  width="2%"><font color="#0000CC">��ͬ�����</font></td>
	<td  width="2%"><font color="#0000CC">����Ѽ����</font></td>
	<td  width="2%"><font color="#0000CC">˰������</font></td>
	<td  width="2%"><font color="#0000CC">����ԭ����</font></td>
	<td  width="2%"><font color="#0000CC">ǩԼ��</font></td>
	<td  width="2%"><font color="#0000CC">ÿƽ�׾���</font></td>
	<td  width="2%"><font color="#0000CC">װ�޼�λ����</font></td>
	<td  width="1%"><font color="#0000CC">˰��ٷֱ�</font></td>
	<td  width="2%"><font color="#0000CC">˰��</font></td>
	<td  width="1%"><font color="#0000CC">����Ѱٷֱ�</font></td>
	<td  width="2%"><font color="#0000CC">��ǰ�����</font></td>
	<td  width="2%"><font color="#0000CC">�ۺ�����</font></td>
	<td  width="2%"><font color="#0000CC">��ǰδ����ǩԼ����Ŀ</font></td>
	<td  width="2%"><font color="#0000CC">�ۺ�δ����ǩԼ����Ŀ</font></td>
	<td  width="4%"><font color="#0000CC">δ����ǩԼ����Ŀ˵��</font></td>
	<td  width="2%"><font color="#0000CC">��Ʒ�</font></td>
	<td  width="2%"><font color="#0000CC">�����</font></td>

	<td  width="1%"><font color="#CC0000">��ͬ�ۿ�</font></td>
	<td  width="1%"><font color="#CC0000">�������ۿ�</font></td>
	<td  width="2%"><font color="#CC0000">��ͬ�����</font></td>
	<td  width="2%"><font color="#CC0000">����Ѽ����</font></td>
	<td  width="2%"><font color="#CC0000">˰������</font></td>
	<td  width="2%"><font color="#CC0000">����ԭ����</font></td>
	<td  width="2%"><font color="#CC0000">ǩԼ��</font></td>
	<td  width="2%"><font color="#CC0000">ÿƽ�׾���</font></td>
	<td  width="2%"><font color="#CC0000">װ�޼�λ����</font></td>
	<td  width="1%"><font color="#CC0000">˰��ٷֱ�</font></td>
	<td  width="2%"><font color="#CC0000">˰��</font></td>
	<td  width="1%"><font color="#CC0000">����Ѱٷֱ�</font></td>
	<td  width="2%"><font color="#CC0000">��ǰ�����</font></td>
	<td  width="2%"><font color="#CC0000">�ۺ�����</font></td>
	<td  width="2%"><font color="#CC0000">��ǰδ����ǩԼ����Ŀ</font></td>
	<td  width="2%"><font color="#CC0000">�ۺ�δ����ǩԼ����Ŀ</font></td>
	<td  width="4%"><font color="#CC0000">δ����ǩԼ����Ŀ˵��</font></td>
	<td  width="2%"><font color="#CC0000">��Ʒ�</font></td>
	<td  width="2%"><font color="#CC0000">�����</font></td>
  </tr>

<%
	pageObj.displayDate();
	pageObj.displayFoot();
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