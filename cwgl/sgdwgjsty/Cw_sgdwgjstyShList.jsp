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



	String jsjlh=null;
	String sgd=null;
	String sgbz=null;
	String jsrq=null;
	String spzt=null;
	String spr=null;
	String spsj=null;
	String lrr=null;
	String lrsj=null;
	String lrbm=null;
	jsjlh=request.getParameter("jsjlh");
	if (jsjlh!=null)
	{
		jsjlh=cf.GB2Uni(jsjlh);
		if (!(jsjlh.equals("")))	wheresql+=" and  (cw_sgdwgjsty.jsjlh='"+jsjlh+"')";
	}
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (cw_sgdwgjsty.sgd='"+sgd+"')";
	}
	sgbz=request.getParameter("sgbz");
	if (sgbz!=null)
	{
		sgbz=cf.GB2Uni(sgbz);
		if (!(sgbz.equals("")))	wheresql+=" and  (cw_sgdwgjsty.sgbz='"+sgbz+"')";
	}
	jsrq=request.getParameter("jsrq");
	if (jsrq!=null)
	{
		jsrq=jsrq.trim();
		if (!(jsrq.equals("")))	wheresql+="  and (cw_sgdwgjsty.jsrq>=TO_DATE('"+jsrq+"','YYYY/MM/DD'))";
	}
	jsrq=request.getParameter("jsrq2");
	if (jsrq!=null)
	{
		jsrq=jsrq.trim();
		if (!(jsrq.equals("")))	wheresql+="  and (cw_sgdwgjsty.jsrq<=TO_DATE('"+jsrq+"','YYYY/MM/DD'))";
	}

	spzt=request.getParameter("spzt");
	if (spzt!=null)
	{
		spzt=cf.GB2Uni(spzt);
		if (!(spzt.equals("")))	wheresql+=" and  (cw_sgdwgjsty.spzt='"+spzt+"')";
	}
	spr=request.getParameter("spr");
	if (spr!=null)
	{
		spr=cf.GB2Uni(spr);
		if (!(spr.equals("")))	wheresql+=" and  (cw_sgdwgjsty.spr='"+spr+"')";
	}
	spsj=request.getParameter("spsj");
	if (spsj!=null)
	{
		spsj=spsj.trim();
		if (!(spsj.equals("")))	wheresql+="  and (cw_sgdwgjsty.spsj>=TO_DATE('"+spsj+"','YYYY/MM/DD'))";
	}
	spsj=request.getParameter("spsj2");
	if (spsj!=null)
	{
		spsj=spsj.trim();
		if (!(spsj.equals("")))	wheresql+="  and (cw_sgdwgjsty.spsj<=TO_DATE('"+spsj+"','YYYY/MM/DD'))";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (cw_sgdwgjsty.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (cw_sgdwgjsty.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (cw_sgdwgjsty.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
		if (!(lrbm.equals("")))	wheresql+=" and  (cw_sgdwgjsty.lrbm='"+lrbm+"')";
	}
	ls_sql =" SELECT cw_sgdwgjsty.jsjlh,cw_sgdwgjsty.khbh,sgdmc,cw_sgdwgjsty.sgbz,crm_khxx.khxm,crm_khxx.fwdz";
	ls_sql+=" ,cw_sgdwgjsty.htgcf,cw_sgdwgjsty.htqtsf,cw_sgdwgjsty.gcfzjx,cw_sgdwgjsty.qtsfzjx,cw_sgdwgjsty.qtfsm";
	ls_sql+=" ,cw_sgdwgjsty.htsgcb,cw_sgdwgjsty.zjxsgcb,cw_sgdwgjsty.ljclf,cw_sgdwgjsty.ljrgf,cw_sgdwgjsty.ssk,cw_sgdwgjsty.jsyh";
	ls_sql+=" ,cw_sgdwgjsty.khpck,cw_sgdwgjsty.yqf,cw_sgdwgjsty.khqk,dm_jsjsbm.jsjsmc,cw_sgdwgjsty.htjsjs,cw_sgdwgjsty.zjxjsjs,cw_sgdwgjsty.jsjsxjje";
	ls_sql+=" ,DECODE(cw_sgdwgjsty.sdljsfs,'1','����������','2','�����������ɸ�','3','���������ɸ�','4','�ֹ�¼�������') sdljsfs";
	ls_sql+=" ,DECODE(cw_sgdwgjsty.sdlqz ,'1','��ǰ','2','�ۺ�','3','ʩ���ɱ���') sdlqz,cw_sgdwgjsty.sdlje,cw_sgdwgjsty.sdljsbl";
	ls_sql+=" ,cw_sgdwgjsty.sdljsje,DECODE(cw_sgdwgjsty.zjxjffs,'1','������','2','�ۼ��ۺ���������','3','�ۼ�������ʩ���ɱ�','4','�ۺ������������','5','����ʩ���ɱ�����ʩ���ɱ�','6','����ʩ���ɱ��ۺ������','7','�ۺ����������ʩ���ɱ�') zjxjffs";
	ls_sql+=" ,DECODE(cw_sgdwgjsty.zjxbhfw,'1','����','2','������','3','���̣�������','4','����(��ˮ��)','5','���̣�������(��ˮ��)') zjxbhfw";
	ls_sql+=" ,DECODE(cw_sgdwgjsty.zjxsjd,'1','ȫ��','2','����ǰ','3','������') zjxsjd,cw_sgdwgjsty.ljzjxxs,cw_sgdwgjsty.ljzjxje";
	ls_sql+=" ,cw_sgdwgjsty.zxxs,cw_sgdwgjsty.zxje,cw_sgdwgjsty.jxxs,cw_sgdwgjsty.jxje,DECODE(cw_sgdwgjsty.sfkyqpc,'Y','�Զ���ȡ','S','�˹�¼��','N','��') sfkyqpc";
	ls_sql+=" ,cw_sgdwgjsty.kyqf,cw_sgdwgjsty.kkhpck,cw_sgdwgjsty.kkhqk,DECODE(cw_sgdwgjsty.zcsfjs,'1','������','2','����������','3','�˹�¼��') zcsfjs";
	ls_sql+=" ,DECODE(cw_sgdwgjsty.zcjehqfs,'1','�Զ���ȡ','2','�˹�¼��') zcjehqfs,DECODE(cw_sgdwgjsty.zcjsblkg,'1','���޸�','2','�����޸�') zcjsblkg";
	ls_sql+=" ,cw_sgdwgjsty.zcjsbl,cw_sgdwgjsty.zcje,cw_sgdwgjsty.zcjsje,cw_sgdwgjsty.jsjsze,cw_sgdwgjsty.jsbl,cw_sgdwgjsty.tzjsbl";
	ls_sql+=" ,cw_sgdwgjsty.jsje,cw_sgdwgjsty.rgfjse,cw_sgdwgjsty.flfjse,DECODE(cw_sgdwgjsty.sfkclk,'Y','��','N','��') sfkclk";
	ls_sql+=" ,cw_sgdwgjsty.clf,DECODE(cw_sgdwgjsty.sfkgdyp,'Y','��','N','��') sfkgdyp,cw_sgdwgjsty.gdyp,DECODE(cw_sgdwgjsty.sfkyfgf,'Y','��','N','��') sfkyfgf";
	ls_sql+=" ,cw_sgdwgjsty.yfgf,DECODE(cw_sgdwgjsty.sfkzbj,'Y','���ʱ���������ɸ�','M','���ʱ�������ɸ�','N','�����ʱ���') sfkzbj";
	ls_sql+=" ,DECODE(cw_sgdwgjsty.kzbjjs,'1','�������','2','�����ܶ�') kzbjjs,cw_sgdwgjsty.kzbjbl,cw_sgdwgjsty.kzbj,DECODE(cw_sgdwgjsty.sfkclfk,'Y','�Զ���ȡ','S','�˹�¼��','N','��') sfkclfk ";
	ls_sql+=" ,cw_sgdwgjsty.clfk,DECODE(cw_sgdwgjsty.sfkclyf,'Y','�Զ���ȡ','S','�˹�¼��','N','��') sfkclyf,cw_sgdwgjsty.clyf,DECODE(cw_sgdwgjsty.sfkzckk,'Y','�Զ���ȡ','S','�˹�¼��','N','��') sfkzckk,cw_sgdwgjsty.zckk,DECODE(cw_sgdwgjsty.sfjzcjl,'Y','�Զ���ȡ','S','�˹�¼��','N','��') sfjzcjl";
	ls_sql+=" ,cw_sgdwgjsty.zcjl,DECODE(cw_sgdwgjsty.sfkfkje,'Y','�Զ���ȡ','S','�˹�¼��','N','��') sfkfkje,cw_sgdwgjsty.fkje,DECODE(cw_sgdwgjsty.sfjjlje,'Y','�Զ���ȡ','S','�˹�¼��','N','��') sfjjlje,cw_sgdwgjsty.jlje,DECODE(cw_sgdwgjsty.sfjqtje,'Y','�Զ���ȡ','S','�˹�¼��','N','��') sfjqtje,cw_sgdwgjsty.qtje,cw_sgdwgjsty.yfje";
	ls_sql+=" ,cw_sgdwgjsty.jsrq,DECODE(cw_sgdwgjsty.spzt,'1','δ����','2','����ͬ��','3','������ͬ��') spztmc,cw_sgdwgjsty.spr,cw_sgdwgjsty.spsj,cw_sgdwgjsty.spyj,cw_sgdwgjsty.lrr,cw_sgdwgjsty.lrsj,sq_dwxx.dwmc,cw_sgdwgjsty.bz  ";
	ls_sql+=" FROM crm_khxx,cw_sgdwgjsty,sq_sgd,sq_dwxx,bdm_bjjbbm,dm_jsjsbm  ";
    ls_sql+=" where cw_sgdwgjsty.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and cw_sgdwgjsty.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_sgdwgjsty.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and cw_sgdwgjsty.jsjs=dm_jsjsbm.jsjsbm(+)";
    ls_sql+=" and cw_sgdwgjsty.spzt='1'";
    ls_sql+=" and crm_khxx.gdjsjd='Y'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_sgdwgjsty.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_sgdwgjstyShList.jsp","","","ShCw_sgdwgjsty.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jsjlh","khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","sgd","sgbz","jsrq","ysglk","zjsge","cfje","jsglk","rgfbfb","yfrgf","bcrgf","flkbfb","ycflk","bcflk","gsfl","psfl","kzbjbl","kzbj","fk","kqtk","kqtksm","bcfkhj","lx","spzt","spr","spsj","spyj","lrr","lrsj","lrbm","bz","bx","pck"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("���");
//���ð�ť����
	String[] buttonName={"�������"};//��ť����ʾ����
	String[] buttonLink={"SavePlSh.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"jsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/cwgl/sgdwgjsty/ViewCw_sgdwgjsty.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jsjlh",coluParm);//�в����������Hash��
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
  <B><font size="3">�������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(900);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="1%">�����¼��</td>
	<td  width="1%">�ͻ����</td>
	<td  width="1%">ʩ����</td>
	<td  width="1%">�ֳ�������</td>
	<td  width="1%">�ͻ�����</td>
	<td  width="3%">���ݵ�ַ</td>
	<td  width="1%">��ͬ���̶�</td>
	<td  width="1%">��ͬ�����շ�</td>
	<td  width="1%">���̷�������</td>
	<td  width="1%">������������</td>
	<td  width="3%">������˵��</td>
	<td  width="1%">��ͬ��ʩ���ɱ�</td>
	<td  width="1%">������ʩ���ɱ�</td>
	<td  width="1%">�ۼƲ��Ϸ�</td>
	<td  width="1%">�ۼ��˹���</td>
	<td  width="1%">ʵ�տ�</td>
	<td  width="1%">�ͻ������Ż�</td>
	<td  width="1%">�ͻ��⳥��</td>
	<td  width="1%">���ڷ�</td>
	<td  width="1%">�ͻ�Ƿ��</td>
	<td  width="2%">�������</td>
	<td  width="1%">��ͬ�������</td>
	<td  width="1%">������������</td>
	<td  width="1%">����������</td>
	<td  width="1%">ˮ��·���㷽ʽ</td>
	<td  width="1%">ˮ��·ȡֵ</td>
	<td  width="1%">ˮ��·���</td>
	<td  width="1%">ˮ��·�������</td>
	<td  width="1%">ˮ��·������</td>
	<td  width="1%">���������ʽ</td>
	<td  width="1%">�����������Χ</td>
	<td  width="1%">������ʱ���</td>
	<td  width="1%">�ۼ�������ϵ��</td>
	<td  width="1%">�ۼ�������</td>
	<td  width="1%">����ϵ��</td>
	<td  width="1%">������</td>
	<td  width="1%">����ϵ��</td>
	<td  width="1%">������</td>
	<td  width="1%">�Ƿ�����ڷ��⳥��</td>
	<td  width="1%">�����ڷ�</td>
	<td  width="1%">�ۿͻ��⳥��</td>
	<td  width="1%">�ۿͻ�Ƿ��</td>
	<td  width="1%">�����Ƿ����</td>
	<td  width="1%">���Ľ���ȡ��ʽ</td>
	<td  width="1%">���Ľ���������޸�</td>
	<td  width="1%">���Ľ������</td>
	<td  width="1%">���Ľ��</td>
	<td  width="1%">���Ľ�����</td>
	<td  width="1%">��������ܶ�</td>
	<td  width="1%">�������</td>
	<td  width="1%">�����������</td>
	<td  width="1%">�����ܶ�</td>
	<td  width="1%">�˹��ѽ����</td>
	<td  width="1%">���Ϸѽ����</td>
	<td  width="1%">�Ƿ�۲��Ͽ�</td>
	<td  width="1%">���Ϸ�</td>
	<td  width="1%">�Ƿ�۹�����Ʒ</td>
	<td  width="1%">������Ʒ</td>
	<td  width="1%">�Ƿ���Ѹ�����</td>
	<td  width="1%">�Ѹ�����</td>
	<td  width="1%">�Ƿ���ʱ���</td>
	<td  width="1%">���ʱ������</td>
	<td  width="1%">���ʱ������</td>
	<td  width="1%">���ʱ���</td>
	<td  width="1%">�Ƿ�۸��ķ���</td>
	<td  width="1%">���ķ���</td>
	<td  width="1%">�Ƿ�۲����˷�</td>
	<td  width="1%">�����˷�</td>
	<td  width="1%">�Ƿ�����Ŀۿ�</td>
	<td  width="1%">���Ŀۿ�</td>
	<td  width="1%">�Ƿ�����Ľ���</td>
	<td  width="1%">���Ľ���</td>
	<td  width="1%">�Ƿ�۷�����</td>
	<td  width="1%">������</td>
	<td  width="1%">�Ƿ�ӽ������</td>
	<td  width="1%">�������</td>
	<td  width="1%">�Ƿ���������</td>
	<td  width="1%">�������</td>
	<td  width="1%">Ӧ�����</td>
	<td  width="1%">��������</td>
	<td  width="1%">����״̬</td>
	<td  width="1%">������</td>
	<td  width="1%">����ʱ��</td>
	<td  width="2%">�������</td>
	<td  width="1%">¼����</td>
	<td  width="1%">¼��ʱ��</td>
	<td  width="2%">¼�벿��</td>
	<td  width="81%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
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