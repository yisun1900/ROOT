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
	String jc_cxhd_cxhdbm=null;
	String jc_cxhd_cxhdmc=null;
	String jc_cxhd_fgsbh=null;
	String jc_cxhd_dj=null;
	String jc_cxhd_gcfzk=null;
	String jc_cxhd_gczxzk=null;
	String jc_cxhd_glfzk=null;
	String jc_cxhd_fjmc=null;
	String jc_cxhd_jsbz=null;
	String jc_cxhd_spbz=null;

	String hdlx=null;
	String zklx=null;
	hdlx=request.getParameter("hdlx");
	if (hdlx!=null)
	{
		hdlx=cf.GB2Uni(hdlx);
		if (!(hdlx.equals("")))	wheresql+=" and  (jc_cxhd.hdlx='"+hdlx+"')";
	}
	zklx=request.getParameter("zklx");
	if (zklx!=null)
	{
		zklx=cf.GB2Uni(zklx);
		if (!(zklx.equals("")))	wheresql+=" and  (jc_cxhd.zklx='"+zklx+"')";
	}

	String kgxqthd=null;
	kgxqthd=request.getParameter("kgxqthd");
	if (kgxqthd!=null)
	{
		kgxqthd=cf.GB2Uni(kgxqthd);
		if (!(kgxqthd.equals("")))	wheresql+=" and  (jc_cxhd.kgxqthd='"+kgxqthd+"')";
	}

	jc_cxhd_cxhdbm=request.getParameter("jc_cxhd_cxhdbm");
	if (jc_cxhd_cxhdbm!=null)
	{
		jc_cxhd_cxhdbm=cf.GB2Uni(jc_cxhd_cxhdbm);
		if (!(jc_cxhd_cxhdbm.equals("")))	wheresql+=" and  (jc_cxhd.cxhdbm='"+jc_cxhd_cxhdbm+"')";
	}
	jc_cxhd_cxhdmc=request.getParameter("jc_cxhd_cxhdmc");
	if (jc_cxhd_cxhdmc!=null)
	{
		jc_cxhd_cxhdmc=cf.GB2Uni(jc_cxhd_cxhdmc);
		if (!(jc_cxhd_cxhdmc.equals("")))	wheresql+=" and  (jc_cxhd.cxhdmc like '%"+jc_cxhd_cxhdmc+"%')";
	}
	jc_cxhd_fgsbh=request.getParameter("jc_cxhd_fgsbh");
	if (jc_cxhd_fgsbh!=null)
	{
		jc_cxhd_fgsbh=cf.GB2Uni(jc_cxhd_fgsbh);
		if (!(jc_cxhd_fgsbh.equals("")))	wheresql+=" and  (jc_cxhd.fgsbh='"+jc_cxhd_fgsbh+"')";
	}
	jc_cxhd_dj=request.getParameter("jc_cxhd_dj");
	if (jc_cxhd_dj!=null)
	{
		jc_cxhd_dj=jc_cxhd_dj.trim();
		if (!(jc_cxhd_dj.equals("")))	wheresql+=" and (jc_cxhd.dj="+jc_cxhd_dj+") ";
	}
	jc_cxhd_gcfzk=request.getParameter("jc_cxhd_gcfzk");
	if (jc_cxhd_gcfzk!=null)
	{
		jc_cxhd_gcfzk=jc_cxhd_gcfzk.trim();
		if (!(jc_cxhd_gcfzk.equals("")))	wheresql+=" and  (jc_cxhd.gcfzk="+jc_cxhd_gcfzk+") ";
	}
	jc_cxhd_gczxzk=request.getParameter("jc_cxhd_gczxzk");
	if (jc_cxhd_gczxzk!=null)
	{
		jc_cxhd_gczxzk=jc_cxhd_gczxzk.trim();
		if (!(jc_cxhd_gczxzk.equals("")))	wheresql+=" and  (jc_cxhd.gczxzk="+jc_cxhd_gczxzk+") ";
	}
	jc_cxhd_glfzk=request.getParameter("jc_cxhd_glfzk");
	if (jc_cxhd_glfzk!=null)
	{
		jc_cxhd_glfzk=jc_cxhd_glfzk.trim();
		if (!(jc_cxhd_glfzk.equals("")))	wheresql+=" and  (jc_cxhd.glfzk="+jc_cxhd_glfzk+") ";
	}
	jc_cxhd_fjmc=request.getParameter("jc_cxhd_fjmc");
	if (jc_cxhd_fjmc!=null)
	{
		jc_cxhd_fjmc=cf.GB2Uni(jc_cxhd_fjmc);
		if (!(jc_cxhd_fjmc.equals("")))	wheresql+=" and  (jc_cxhd.fjmc='"+jc_cxhd_fjmc+"')";
	}
	jc_cxhd_jsbz=request.getParameter("jc_cxhd_jsbz");
	if (jc_cxhd_jsbz!=null)
	{
		jc_cxhd_jsbz=cf.GB2Uni(jc_cxhd_jsbz);
		if (!(jc_cxhd_jsbz.equals("")))	wheresql+=" and  (jc_cxhd.jsbz='"+jc_cxhd_jsbz+"')";
	}
	jc_cxhd_spbz=request.getParameter("jc_cxhd_spbz");
	if (jc_cxhd_spbz!=null)
	{
		jc_cxhd_spbz=cf.GB2Uni(jc_cxhd_spbz);
		if (!(jc_cxhd_spbz.equals("")))	wheresql+=" and  (jc_cxhd.spbz='"+jc_cxhd_spbz+"')";
	}
	ls_sql="SELECT jc_cxhd.cxhdbm,jc_cxhd.cxhdmc,DECODE(jc_cxhd.zklx,'1','��������','2','�������','3','���ַ��ô���','4','���ۿ�') zklx, sq_dwxx.dwmc,DECODE(jc_cxhd.jsbz,'N','δ����','Y','����') jsbz,jc_cxhdsj.kssj,jc_cxhdsj.cxjssj,jc_cxhdsj.qdjssj,jc_cxhd.dj,jc_cxhd.fxgck,jc_cxhd.fxzck,jc_cxhd.zdzk,jc_cxhd.gcfzk,jc_cxhd.glfzk,jc_cxhd.sjzk,jc_cxhd.sjfzk,jc_cxhd.qtsfxmzk,DECODE(jc_cxhd.zjxzklx,'1','ͬ��ͬ','2','�����ۿ�'),DECODE(jc_cxhd.sfybfxmzk,'Y','��','N','��'),'<A HREF=\"/jcjj/cxhd/file/'||jc_cxhd.fjmc||'\" target=\"_blank\">'||jc_cxhd.fjmc||'</A>' fjmc, DECODE(jc_cxhd.hdlx,'1','�޻','2','��˾�','3','С���','4','չ��','5','�г��') hdlx, DECODE(jc_cxhd.kgxqthd,'1','���ɹ���','2','�ɹ���') kgxqthd, DECODE(jc_cxhd.spbz,'N','δ����','Y','����') spbz,jc_cxhd.bz  ";
	ls_sql+=" FROM jc_cxhd,sq_dwxx,jc_cxhdsj  ";
    ls_sql+=" where jc_cxhd.fgsbh=sq_dwxx.dwbh";
    ls_sql+=" and jc_cxhd.cxhdbm=jc_cxhdsj.cxhdbm";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_cxhd.fgsbh,jc_cxhd.jsbz,jc_cxhd.cxhdmc,jc_cxhdsj.kssj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_cxhdCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"cxhdbm","jc_cxhd_cxhdmc","sq_dwxx_dwmc","jc_cxhd_dj","jc_cxhd_gcfzk","jc_cxhd_gczxzk","jc_cxhd_glfzk","jc_cxhd_fjmc","jc_cxhd_hdlx","jc_cxhd_zklx","jc_cxhd_jsbz","jc_cxhd_spbz","jc_cxhd_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"cxhdbm"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"cxhdbm"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewJc_cxhd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("cxhdbm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.alignStr[15]="align='left'";
	pageObj.alignStr[16]="align='left'";

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("cxhdbm","1");//�в����������Hash��
	spanColHash.put("cxhdmc","1");//�в����������Hash��
	spanColHash.put("zklx","1");//�в����������Hash��
	spanColHash.put("dwmc","1");//�в����������Hash��
	spanColHash.put("jsbz","1");//�в����������Hash��

	spanColHash.put("dj","1");//�в����������Hash��
	spanColHash.put("zdzk","1");//�в����������Hash��
	spanColHash.put("gcfzk","1");//�в����������Hash��
	spanColHash.put("gczxzk","1");//�в����������Hash��
	spanColHash.put("glfzk","1");//�в����������Hash��
	spanColHash.put("fjmc","1");//�в����������Hash��
	spanColHash.put("hdlx","1");//�в����������Hash��
	spanColHash.put("kgxqthd","1");//�в����������Hash��
	spanColHash.put("spbz","1");//�в����������Hash��
	spanColHash.put("bz","1");//�в����������Hash��

	pageObj.setSpanCol(spanColHash);//�в����������Hash��
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
  <B><font size="3">�����������ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(290);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">���������</td>
	<td  width="12%">���������</td>
	<td  width="3%">�ۿ�����</td>
	<td  width="5%">�ֹ�˾</td>
	<td  width="3%">������־</td>
	<td  width="3%">��ʼʱ��(>=)</td>
	<td  width="3%">��������ʱ��(<=)</td>
	<td  width="3%">ǩ������ʱ��(<=)</td>
	<td  width="3%">����</td>
	<td  width="2%">�౶���ֹ��̿�</td>
	<td  width="2%">�౶�������Ŀ�</td>
	<td  width="3%">�����ۿ�</td>
	<td  width="3%">���̷��ۿ�</td>
	<td  width="3%">������ۿ�</td>
	<td  width="3%">˰���ۿ�</td>
	<td  width="3%">��Ʒ��ۿ�</td>
	<td  width="3%">�����շ���Ŀ�ۿ�</td>
	<td  width="3%">�������ۿ�</td>
	<td  width="3%">�Ƿ��в�����Ŀ����</td>
	<td  width="10%">��������</td>
	<td  width="3%">�����</td>
	<td  width="3%">�ɹ��������</td>
	<td  width="3%">������־</td>
	<td  width="19%">��ע</td>
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